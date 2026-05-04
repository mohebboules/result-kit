import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// A typed failure returned inside [Result.err].
///
/// Use `.when(...)` or [FailureX.message] to handle each variant.
@freezed
sealed class Failure with _$Failure {
  /// The device has no network connectivity, or the request timed out.
  const factory Failure.network(String message) = NetworkFailure;

  /// The request was rejected due to missing or invalid credentials (HTTP 401).
  const factory Failure.auth(String message) = AuthFailure;

  /// The server returned a non-2xx, non-401 status.
  const factory Failure.server(String message) = ServerFailure;

  /// An unexpected exception that does not fit any other category.
  const factory Failure.unknown(String message) = UnknownFailure;
}
