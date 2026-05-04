class PaginationMetadata {
  final int currentPage;
  final int itemsPerPage;
  final int totalItems;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPrevPage;

  const PaginationMetadata({
    required this.currentPage,
    required this.itemsPerPage,
    required this.totalItems,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPrevPage,
  });

  factory PaginationMetadata.fromJson(Map<String, dynamic> json) {
    final int currentPage = json['page'] as int? ?? 1;
    final int totalPages = json['totalPages'] as int? ?? 1;
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
