import '../result/result.dart';

/// A use case that performs an async operation with parameters and returns [Result<T>].
abstract interface class AsyncUseCase<T, Params> {
  Future<Result<T>> call(Params params);
}

/// A use case that performs an async operation without parameters and returns [Result<T>].
abstract interface class AsyncUseCaseNoParams<T> {
  Future<Result<T>> call();
}

/// A use case that performs a synchronous operation with parameters.
abstract interface class SyncUseCase<T, Params> {
  T call(Params params);
}

/// A use case that performs a synchronous operation without parameters.
abstract interface class SyncUseCaseNoParams<T> {
  T call();
}
