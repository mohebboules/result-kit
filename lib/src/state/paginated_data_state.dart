import 'package:freezed_annotation/freezed_annotation.dart';

import '../result/failure.dart';
import 'pagination_metadata.dart';

part 'paginated_data_state.freezed.dart';

/// A five-state machine for paginated async data-fetching operations.
///
/// Typical flow:
/// [PaginatedDataState.initial] → [PaginatedDataState.loading] →
/// [PaginatedDataState.success] | [PaginatedDataState.empty] | [PaginatedDataState.failure]
///
/// When loading more pages, transition to a [PaginatedDataState.success] with
/// [isLoadingMore] set to `true` while the next page request is in flight.
@Freezed(genericArgumentFactories: true)
class PaginatedDataState<T> with _$PaginatedDataState<T> {
  /// The initial state before any load is triggered.
  const factory PaginatedDataState.initial() = PaginatedInitial<T>;

  /// A load is in progress.
  const factory PaginatedDataState.loading() = PaginatedLoading<T>;

  /// The data was loaded successfully.
  ///
  /// Set [isLoadingMore] to `true` while fetching an additional page.
  const factory PaginatedDataState.success({
    required List<T> items,
    required PaginationMetadata metadata,
    @Default(false) bool isLoadingMore,
  }) = PaginatedSuccess<T>;

  /// The load succeeded but returned no data.
  const factory PaginatedDataState.empty() = PaginatedEmpty<T>;

  /// The load failed with a typed [failure].
  const factory PaginatedDataState.failure(Failure failure) = PaginatedFailure<T>;
}

/// Extensions on [PaginatedDataState] for convenient state inspection without pattern-matching.
extension PaginatedDataStateExtensions<T> on PaginatedDataState<T> {
  /// Whether this is [PaginatedLoading].
  bool get isLoading => this is PaginatedLoading<T>;

  /// Whether this is [PaginatedFailure].
  bool get isFailure => this is PaginatedFailure<T>;

  /// Whether this is [PaginatedSuccess].
  bool get isSuccess => this is PaginatedSuccess<T>;

  /// Whether this is [PaginatedEmpty].
  bool get isEmpty => this is PaginatedEmpty<T>;

  /// Whether this is [PaginatedInitial].
  bool get isInitial => this is PaginatedInitial<T>;

  /// The failure, or `null` if the state is not [PaginatedFailure].
  Failure? get failure => isFailure ? (this as PaginatedFailure<T>).failure : null;

  /// Convenience message from [failure], or `null` if not an error state.
  String? get errorMessage => failure?.message;

  /// The loaded items, or `null` if the state is not [PaginatedSuccess].
  List<T>? get items => isSuccess ? (this as PaginatedSuccess<T>).items : null;

  /// Whether there are more pages to load.
  bool get hasMore => isSuccess && (this as PaginatedSuccess<T>).metadata.hasNextPage;

  /// Whether an additional page is currently loading.
  bool get isLoadingMore => isSuccess && (this as PaginatedSuccess<T>).isLoadingMore;

  /// The pagination metadata, or `null` if the state is not [PaginatedSuccess].
  PaginationMetadata? get metadata => isSuccess ? (this as PaginatedSuccess<T>).metadata : null;
}
