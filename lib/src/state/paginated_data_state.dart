import 'package:freezed_annotation/freezed_annotation.dart';

import '../result/failure.dart';
import 'pagination_metadata.dart';

part 'paginated_data_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
class PaginatedDataState<T> with _$PaginatedDataState<T> {
  const factory PaginatedDataState.initial() = PaginatedInitial<T>;
  const factory PaginatedDataState.loading() = PaginatedLoading<T>;
  const factory PaginatedDataState.success({
    required List<T> items,
    required PaginationMetadata metadata,
    @Default(false) bool isLoadingMore,
  }) = PaginatedSuccess<T>;
  const factory PaginatedDataState.empty() = PaginatedEmpty<T>;
  const factory PaginatedDataState.failure(Failure message) = PaginatedFailure<T>;
}

extension PaginatedDataStateExtensions<T> on PaginatedDataState<T> {
  bool get isError => this is PaginatedFailure<T>;
  bool get isLoading => this is PaginatedLoading<T>;
  bool get isLoaded => this is PaginatedSuccess<T>;
  bool get isEmpty => this is PaginatedEmpty<T>;
  bool get isInitial => this is PaginatedInitial<T>;

  /// The failure, or `null` if the state is not [PaginatedError].
  Failure? get failure => isError ? (this as PaginatedFailure<T>).failure : null;

  /// Convenience message from [failure], or `null` if not an error state.
  String? get errorMessage => failure?.message;

  /// The loaded items, or `null` if the state is not [PaginatedLoaded].
  List<T>? get items => isLoaded ? (this as PaginatedSuccess<T>).items : null;

  bool get hasMore => isLoaded && (this as PaginatedSuccess<T>).metadata.hasNextPage;
  bool get isLoadingMore => isLoaded && (this as PaginatedSuccess<T>).isLoadingMore;

  /// The pagination metadata, or `null` if the state is not [PaginatedLoaded].
  PaginationMetadata? get metadata => isLoaded ? (this as PaginatedSuccess<T>).metadata : null;
}
