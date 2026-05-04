import '../result/failure.dart';
import '../result/result.dart';

extension ResultX<T> on Result<T> {
  bool get isOk => this is Ok<T>;
  bool get isErr => this is Err<T>;
  T? get valueOrNull => this is Ok<T> ? (this as Ok<T>).value : null;
  Failure? get failureOrNull => this is Err<T> ? (this as Err<T>).failure : null;

  R fold<R>({required R Function(T) ok, required R Function(Failure) err}) => when(ok: ok, err: err);
}
