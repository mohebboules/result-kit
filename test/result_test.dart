import 'package:result_kit/result_kit.dart';
import 'package:test/test.dart';

void main() {
  group('Result', () {
    test('ok carries the value', () {
      const result = Result.ok(42);
      expect((result as Ok).value, 42);
    });

    test('err carries the failure', () {
      const result = Result<int>.err(Failure.network('no connection'));
      expect((result as Err).failure, isA<NetworkFailure>());
    });
  });

  group('ResultX', () {
    const ok = Result.ok('hello');
    const err = Result<String>.err(Failure.auth('unauthorized'));

    test('isOk is true for Ok', () => expect(ok.isOk, isTrue));
    test('isOk is false for Err', () => expect(err.isOk, isFalse));
    test('isErr is true for Err', () => expect(err.isErr, isTrue));
    test('isErr is false for Ok', () => expect(ok.isErr, isFalse));

    test('valueOrNull returns value on Ok', () => expect(ok.valueOrNull, 'hello'));
    test('valueOrNull returns null on Err', () => expect(err.valueOrNull, isNull));

    test('failureOrNull returns null on Ok', () => expect(ok.failureOrNull, isNull));
    test('failureOrNull returns failure on Err', () {
      expect(err.failureOrNull, isA<AuthFailure>());
    });

    test('fold calls ok branch on Ok', () {
      final result = ok.fold(ok: (v) => 'got $v', err: (_) => 'error');
      expect(result, 'got hello');
    });

    test('fold calls err branch on Err', () {
      final result = err.fold(ok: (_) => 'ok', err: (f) => f.message);
      expect(result, 'unauthorized');
    });
  });

  group('Failure', () {
    test('network carries message', () {
      const f = Failure.network('no internet');
      expect((f as NetworkFailure).message, 'no internet');
    });

    test('auth carries message', () {
      const f = Failure.auth('token expired');
      expect((f as AuthFailure).message, 'token expired');
    });

    test('server carries message', () {
      const f = Failure.server('500');
      expect((f as ServerFailure).message, '500');
    });

    test('unknown carries message', () {
      const f = Failure.unknown('something blew up');
      expect((f as UnknownFailure).message, 'something blew up');
    });
  });

  group('FailureX.message', () {
    test('returns message for network failure', () {
      expect(const Failure.network('offline').message, 'offline');
    });

    test('returns message for auth failure', () {
      expect(const Failure.auth('401').message, '401');
    });

    test('returns message for server failure', () {
      expect(const Failure.server('500').message, '500');
    });

    test('returns message for unknown failure', () {
      expect(const Failure.unknown('oops').message, 'oops');
    });
  });
}
