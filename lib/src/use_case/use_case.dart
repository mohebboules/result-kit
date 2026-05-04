import '../result/result.dart';

/**
 * Use case that returns a result
 * @param T the type of the result
 * @param Params the type of the parameters
 */
abstract interface class AsyncUseCase<T, Params> {
  Future<Result<T>> call(Params params);
}

/**
 * Use case that returns a result
 * @param T the type of the result
 */
abstract interface class AsyncUseCaseNoParams<T> {
  Future<Result<T>> call();
}

/**
 * Use case that returns a result
 * @param T the type of the result
 * @param Params the type of the parameters
 */
abstract interface class SyncUseCase<T, Params> {
  T call(Params params);
}

/**
 * Use case that returns a result
 * @param T the type of the result
 */
abstract interface class SyncUseCaseNoParams<T> {
  T call();
}
