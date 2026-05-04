import '../result/result.dart';

/// A use case that performs an async operation with parameters and returns [Result<T>].
abstract interface class AsyncUseCase<T, Params> {
  /// Executes the use case with the given [params].
  Future<Result<T>> call(Params params);
}

/// A use case that performs an async operation without parameters and returns [Result<T>].
abstract interface class AsyncUseCaseNoParams<T> {
  /// Executes the use case.
  Future<Result<T>> call();
}

/// A use case that performs a synchronous operation with parameters.
abstract interface class SyncUseCase<T, Params> {
  /// Executes the use case with the given [params].
  T call(Params params);
}

/// A use case that performs a synchronous operation without parameters.
abstract interface class SyncUseCaseNoParams<T> {
  /// Executes the use case.
  T call();
}
