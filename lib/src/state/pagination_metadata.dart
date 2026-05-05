import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_metadata.freezed.dart';

/// Pagination metadata returned from a paginated API endpoint.
///
/// Construct manually or use [PaginationMetadata.fromJson] for responses
/// that carry page, limit, total-items, and total-pages fields.
@freezed
abstract class PaginationMetadata with _$PaginationMetadata {
  /// Creates pagination metadata with all fields specified explicitly.
  const factory PaginationMetadata({
    required int currentPage,
    required int itemsPerPage,
    required int totalItems,
    required int totalPages,
    required bool hasNextPage,
    required bool hasPrevPage,
  }) = _PaginationMetadata;

  /// Parses from a JSON map, with customisable field keys.
  ///
  /// Default keys match `{ "page": 1, "limit": 20, "totalItems": 100, "totalPages": 5 }`.
  /// Override any key to match your backend's naming convention:
  ///
  /// ```dart
  /// PaginationMetadata.fromJson(json,
  ///   pageKey: 'pageNumber',
  ///   limitKey: 'pageSize',
  ///   totalItemsKey: 'total',
  ///   totalPagesKey: 'pages',
  /// )
  /// ```
  factory PaginationMetadata.fromJson(
    Map<String, dynamic> json, {
    String pageKey = 'page',
    String limitKey = 'limit',
    String totalItemsKey = 'totalItems',
    String totalPagesKey = 'totalPages',
  }) {
    final currentPage = json[pageKey] as int? ?? 1;
    final totalPages = json[totalPagesKey] as int? ?? 1;
    return PaginationMetadata(
      currentPage: currentPage,
      itemsPerPage: json[limitKey] as int? ?? 10,
      totalItems: json[totalItemsKey] as int? ?? 0,
      totalPages: totalPages,
      hasNextPage: currentPage < totalPages,
      hasPrevPage: currentPage > 1,
    );
  }
}
