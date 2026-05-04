import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:result_kit/result_kit.dart';

part 'data_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
class DataState<T> with _$DataState<T> {
  const factory DataState.initial() = DataInitial<T>;
  const factory DataState.loading() = DataLoading<T>;
  const factory DataState.success(T item) = DataSuccess<T>;
  const factory DataState.empty() = DataEmpty<T>;
  const factory DataState.failure(Failure message) = DataError<T>;
}

extension DataStateExtensions<T> on DataState<T> {
  bool get isFailure => this is DataError<T>;
  bool get isLoading => this is DataLoading<T>;
  bool get isSuccess => this is DataSuccess<T>;
  bool get isEmpty => this is DataEmpty<T>;
  bool get isInitial => this is DataInitial<T>;

  /// The failure, or `null` if the state is not [DataError].
  Failure? get failure => isFailure ? (this as DataError<T>).failure : null;

  /// Convenience message from [failure], or `null` if not an error state.
  String? get errorMessage => failure?.message;

  /// The loaded item, or `null` if the state is not [DataLoaded].
  T? get item => isSuccess ? (this as DataSuccess<T>).item : null;
}
