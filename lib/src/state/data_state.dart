import 'package:freezed_annotation/freezed_annotation.dart';

import '../result/failure.dart';

part 'data_state.freezed.dart';

/// A five-state machine for async data-fetching operations.
///
/// Typical flow:
/// [DataState.initial] → [DataState.loading] →
/// [DataState.success] | [DataState.empty] | [DataState.failure]
@Freezed(genericArgumentFactories: true)
class DataState<T> with _$DataState<T> {
  /// The initial state before any load is triggered.
  const factory DataState.initial() = DataInitial<T>;

  /// A load is in progress.
  const factory DataState.loading() = DataLoading<T>;

  /// The data was loaded successfully, carrying [item].
  const factory DataState.success(T item) = DataSuccess<T>;

  /// The load succeeded but returned no data.
  const factory DataState.empty() = DataEmpty<T>;

  /// The load failed with a typed [failure].
  const factory DataState.failure(Failure failure) = DataFailure<T>;
}

/// Extensions on [DataState] for convenient state inspection without pattern-matching.
extension DataStateExtensions<T> on DataState<T> {
  /// Whether this is [DataFailure].
  bool get isFailure => this is DataFailure<T>;

  /// Whether this is [DataLoading].
  bool get isLoading => this is DataLoading<T>;

  /// Whether this is [DataSuccess].
  bool get isSuccess => this is DataSuccess<T>;

  /// Whether this is [DataEmpty].
  bool get isEmpty => this is DataEmpty<T>;

  /// Whether this is [DataInitial].
  bool get isInitial => this is DataInitial<T>;

  /// The failure, or `null` if the state is not [DataFailure].
  Failure? get failure => isFailure ? (this as DataFailure<T>).failure : null;

  /// Convenience message from [failure], or `null` if not an error state.
  String? get errorMessage => failure?.message;

  /// The loaded item, or `null` if the state is not [DataSuccess].
  T? get item => isSuccess ? (this as DataSuccess<T>).item : null;
}
