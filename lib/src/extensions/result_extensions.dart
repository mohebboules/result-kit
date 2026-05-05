import '../result/failure.dart';
import '../result/result.dart';

/// Extensions on [Result] for convenient access to values without pattern-matching.
extension ResultX<T> on Result<T> {
  /// Whether this result is [Ok].
  bool get isOk => this is Ok<T>;

  /// Whether this result is [Err].
  bool get isErr => this is Err<T>;

  /// The success value, or `null` if this is [Err].
  T? get valueOrNull => this is Ok<T> ? (this as Ok<T>).value : null;

  /// The failure, or `null` if this is [Ok].
  Failure? get failureOrNull => this is Err<T> ? (this as Err<T>).failure : null;

  /// Maps this result to [R] by applying [ok] on success or [err] on failure.
  R fold<R>({required R Function(T) ok, required R Function(Failure) err}) => when(ok: ok, err: err);
}
