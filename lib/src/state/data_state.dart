import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
class DataState<T> with _$DataState<T> {
  const factory DataState.initial() = DataInitial<T>;
  const factory DataState.loading() = DataLoading<T>;
  const factory DataState.loaded(T item) = DataLoaded<T>;
  const factory DataState.empty() = DataEmpty<T>;
  const factory DataState.error(String message) = DataError<T>;
}

extension DataStateExtensions<T> on DataState<T> {
  bool get isError => this is DataError<T>;
  bool get isLoading => this is DataLoading<T>;
  bool get isLoaded => this is DataLoaded<T>;
  bool get isEmpty => this is DataEmpty<T>;
  bool get isInitial => this is DataInitial<T>;

  String? get errorMessage => isError ? (this as DataError<T>).message : null;
  T? get item => isLoaded ? (this as DataLoaded<T>).item : null;
}
