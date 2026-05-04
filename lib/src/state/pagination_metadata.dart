import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_metadata.freezed.dart';

/// Pagination metadata returned from a paginated API endpoint.
///
/// Construct manually or use [PaginationMetadata.fromJson] for responses
/// with `page`, `limit`, `totalItems`, and `totalPages` fields.
@freezed
sealed class PaginationMetadata with _$PaginationMetadata {
  const factory PaginationMetadata({
    required int currentPage,
    required int itemsPerPage,
    required int totalItems,
    required int totalPages,
    required bool hasNextPage,
    required bool hasPrevPage,
  }) = _PaginationMetadata;

  /// Parses from a JSON map with the following shape:
  /// ```json
  /// { "page": 1, "limit": 20, "totalItems": 100, "totalPages": 5 }
  /// ```
  factory PaginationMetadata.fromJson(Map<String, dynamic> json) {
    final currentPage = json['page'] as int? ?? 1;
    final totalPages = json['totalPages'] as int? ?? 1;
    return PaginationMetadata(
      currentPage: currentPage,
      itemsPerPage: json['limit'] as int? ?? 10,
      totalItems: json['totalItems'] as int? ?? 0,
      totalPages: totalPages,
      hasNextPage: currentPage < totalPages,
      hasPrevPage: currentPage > 1,
    );
  }
}
