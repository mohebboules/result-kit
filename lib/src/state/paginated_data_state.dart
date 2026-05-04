import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination_metadata.dart';

part 'paginated_data_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
class PaginatedDataState<T> with _$PaginatedDataState<T> {
  const factory PaginatedDataState.initial() = PaginatedInitial<T>;
  const factory PaginatedDataState.loading() = PaginatedLoading<T>;
  const factory PaginatedDataState.loaded({
    required List<T> items,
    required PaginationMetadata metadata,
    @Default(false) bool isLoadingMore,
  }) = PaginatedLoaded<T>;
  const factory PaginatedDataState.empty() = PaginatedEmpty<T>;
  const factory PaginatedDataState.error(String message) = PaginatedError<T>;
}

extension PaginatedDataStateExtensions<T> on PaginatedDataState<T> {
  bool get isError => this is PaginatedError<T>;
  bool get isLoading => this is PaginatedLoading<T>;
  bool get isLoaded => this is PaginatedLoaded<T>;
  bool get isEmpty => this is PaginatedEmpty<T>;
  bool get isInitial => this is PaginatedInitial<T>;

  String? get errorMessage => isError ? (this as PaginatedError<T>).message : null;
  List<T>? get items => isLoaded ? (this as PaginatedLoaded<T>).items : null;
  bool get hasMore => isLoaded && (this as PaginatedLoaded<T>).metadata.hasNextPage;
  bool get isLoadingMore => isLoaded && (this as PaginatedLoaded<T>).isLoadingMore;
  PaginationMetadata? get metadata => isLoaded ? (this as PaginatedLoaded<T>).metadata : null;
}
