import 'package:result_kit/result_kit.dart';
import 'package:test/test.dart';

class _SuccessAdapter implements ApiAdapter {
  const _SuccessAdapter(this._response);
  final ApiResponse _response;
  @override
  Future<ApiResponse> execute() async => _response;
}

class _AdapterExceptionAdapter implements ApiAdapter {
  const _AdapterExceptionAdapter(this._failure);
  final Failure _failure;
  @override
  Future<ApiResponse> execute() async => throw ApiAdapterException(_failure);
}

class _CrashAdapter implements ApiAdapter {
  @override
  Future<ApiResponse> execute() async => throw Exception('unexpected crash');
}

void main() {
  group('ApiGuard.run', () {
    test('2xx returns Result.ok with parsed value', () async {
      final result = await ApiGuard.run(
        adapter: const _SuccessAdapter(ApiResponse(statusCode: 200, data: {'id': 1})),
        parser: (res) => (res.data as Map)['id'] as int,
      );

      expect(result.isOk, isTrue);
      expect(result.valueOrNull, 1);
    });

    test('201 is treated as success', () async {
      final result = await ApiGuard.run(
        adapter: const _SuccessAdapter(ApiResponse(statusCode: 201, data: 'created')),
        parser: (res) => res.data as String,
      );

      expect(result.isOk, isTrue);
    });

    test('401 returns Failure.auth by default', () async {
      final result = await ApiGuard.run<int>(
        adapter: const _SuccessAdapter(ApiResponse(statusCode: 401, data: null)),
        parser: (res) => 0,
      );

      expect(result.isErr, isTrue);
      expect(result.failureOrNull, isA<AuthFailure>());
    });

    test('500 returns Failure.server by default', () async {
      final result = await ApiGuard.run<int>(
        adapter: const _SuccessAdapter(ApiResponse(statusCode: 500, data: null)),
        parser: (res) => 0,
      );

      expect(result.isErr, isTrue);
      expect(result.failureOrNull, isA<ServerFailure>());
    });

    test('non-2xx with onNonSuccess uses custom mapper', () async {
      final result = await ApiGuard.run<int>(
        adapter: const _SuccessAdapter(ApiResponse(statusCode: 403, data: null)),
        parser: (res) => 0,
        onNonSuccess: (_) => const Failure.auth('Forbidden'),
      );

      expect(result.isErr, isTrue);
      expect(result.failureOrNull, isA<AuthFailure>());
      expect(result.failureOrNull!.message, 'Forbidden');
    });

    test('onNonSuccess receives the full response', () async {
      ApiResponse? captured;
      await ApiGuard.run<int>(
        adapter: const _SuccessAdapter(ApiResponse(statusCode: 422, data: {'error': 'invalid'})),
        parser: (res) => 0,
        onNonSuccess: (res) {
          captured = res;
          return const Failure.server('validation');
        },
      );

      expect(captured?.statusCode, 422);
      expect((captured?.data as Map)['error'], 'invalid');
    });

    test('ApiAdapterException forwards the typed failure', () async {
      const failure = Failure.network('no connection');
      final result = await ApiGuard.run<int>(
        adapter: const _AdapterExceptionAdapter(failure),
        parser: (res) => 0,
      );

      expect(result.isErr, isTrue);
      expect(result.failureOrNull, isA<NetworkFailure>());
      expect(result.failureOrNull!.message, 'no connection');
    });

    test('unexpected exception returns Failure.unknown', () async {
      final result = await ApiGuard.run<int>(
        adapter: _CrashAdapter(),
        parser: (res) => 0,
      );

      expect(result.isErr, isTrue);
      expect(result.failureOrNull, isA<UnknownFailure>());
    });

    test('parser exception returns Failure.unknown', () async {
      final result = await ApiGuard.run<int>(
        adapter: const _SuccessAdapter(ApiResponse(statusCode: 200, data: 'not a map')),
        parser: (res) => (res.data as Map)['id'] as int,
      );

      expect(result.isErr, isTrue);
      expect(result.failureOrNull, isA<UnknownFailure>());
    });
  });
}
