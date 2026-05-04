import '../result/failure.dart';
import '../result/result.dart';
import 'api_adapter.dart';
import 'api_response.dart';

/// Executes an HTTP call via [ApiAdapter] and returns a typed [Result].
///
/// Usage:
/// ```dart
/// final result = await ApiGuard.run(
///   adapter: DioAdapter(() => dio.get('/users')),
///   parser: (res) => UserList.fromJson(res.data as Map<String, dynamic>),
/// );
/// ```
abstract final class ApiGuard {
  /// Runs [adapter], maps a 2xx response through [parser], and wraps
  /// any failure as [Failure].
  ///
  /// - 2xx → `Result.ok(parser(response))`
  /// - 401 → `Result.err(Failure.auth(...))`
  /// - other non-2xx → `Result.err(Failure.server(...))`
  /// - [ApiAdapterException] → `Result.err(exception.failure)`
  /// - any other exception → `Result.err(Failure.unknown(...))`
  static Future<Result<T>> run<T>({
    required ApiAdapter adapter,
    required T Function(ApiResponse response) parser,
  }) async {
    try {
      final response = await adapter.execute();
      final status = response.statusCode;

      if (status >= 200 && status < 300) {
        return Result.ok(parser(response));
      }
      if (status == 401) {
        return const Result.err(Failure.auth('Unauthorized'));
      }
      return Result.err(Failure.server('Server error ($status)'));
    } on ApiAdapterException catch (e) {
      return Result.err(e.failure);
    } catch (e) {
      return Result.err(Failure.unknown(e.toString()));
    }
  }
}
