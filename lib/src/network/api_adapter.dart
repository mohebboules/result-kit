import '../result/failure.dart';
import 'api_response.dart';

/// Implement this to connect any HTTP client to [ApiGuard].
///
/// Throw [ApiAdapterException] for recoverable failures (network errors, 4xx responses).
/// Let unexpected exceptions propagate — [ApiGuard] wraps them as [Failure.unknown].
abstract interface class ApiAdapter {
  /// Execute the HTTP call and return a normalised [ApiResponse].
  Future<ApiResponse> execute();
}

/// Thrown by an [ApiAdapter] to signal a typed [Failure] to [ApiGuard].
final class ApiAdapterException implements Exception {
  /// Creates an exception wrapping [failure].
  const ApiAdapterException(this.failure);

  /// The typed failure to be forwarded to [ApiGuard].
  final Failure failure;

  @override
  String toString() => 'ApiAdapterException(${failure.runtimeType})';
}
