import 'package:freezed_annotation/freezed_annotation.dart';

import 'failure.dart';

part 'result.freezed.dart';

/// The result of an operation that can either succeed or fail.
///
/// Use [Result.ok] for success and [Result.err] for failure.
/// Pattern-match with `.when(ok: ..., err: ...)` or use the [ResultX] extension.
@freezed
sealed class Result<T> with _$Result<T> {
  /// A successful result carrying [value].
  const factory Result.ok(T value) = Ok<T>;

  /// A failed result carrying a typed [failure].
  const factory Result.err(Failure failure) = Err<T>;
}
