import '../state/pagination_metadata.dart';

/// Extensions on [PaginationMetadata] for convenient pagination metadata inspection without pattern-matching.
extension PaginationMetadataX on PaginationMetadata {
  /// The number of items to skip to reach the current page (equivalent to `(currentPage - 1) * itemsPerPage`).
  int get skip => (currentPage - 1) * itemsPerPage;

  /// The number of items to limit the page to (equivalent to [itemsPerPage]).
  int get limit => itemsPerPage;

  /// The number of the next page (equivalent to [currentPage] + 1).
  int get nextPage => currentPage + 1;
}
