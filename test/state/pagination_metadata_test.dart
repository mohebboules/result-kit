import 'package:result_kit/result_kit.dart';
import 'package:test/test.dart';

void main() {
  group('PaginationMetadata.fromJson — default keys', () {
    test('parses all fields', () {
      final meta = PaginationMetadata.fromJson({
        'page': 2,
        'limit': 20,
        'totalItems': 100,
        'totalPages': 5,
      });

      expect(meta.currentPage, 2);
      expect(meta.itemsPerPage, 20);
      expect(meta.totalItems, 100);
      expect(meta.totalPages, 5);
    });

    test('hasNextPage is true when currentPage < totalPages', () {
      final meta = PaginationMetadata.fromJson({'page': 2, 'limit': 10, 'totalItems': 30, 'totalPages': 3});
      expect(meta.hasNextPage, isTrue);
    });

    test('hasNextPage is false on last page', () {
      final meta = PaginationMetadata.fromJson({'page': 3, 'limit': 10, 'totalItems': 30, 'totalPages': 3});
      expect(meta.hasNextPage, isFalse);
    });

    test('hasPrevPage is true when currentPage > 1', () {
      final meta = PaginationMetadata.fromJson({'page': 2, 'limit': 10, 'totalItems': 30, 'totalPages': 3});
      expect(meta.hasPrevPage, isTrue);
    });

    test('hasPrevPage is false on first page', () {
      final meta = PaginationMetadata.fromJson({'page': 1, 'limit': 10, 'totalItems': 30, 'totalPages': 3});
      expect(meta.hasPrevPage, isFalse);
    });

    test('falls back to defaults when fields are absent', () {
      final meta = PaginationMetadata.fromJson({});
      expect(meta.currentPage, 1);
      expect(meta.itemsPerPage, 10);
      expect(meta.totalItems, 0);
      expect(meta.totalPages, 1);
      expect(meta.hasNextPage, isFalse);
      expect(meta.hasPrevPage, isFalse);
    });
  });

  group('PaginationMetadata.fromJson — custom keys', () {
    test('parses with custom field names', () {
      final meta = PaginationMetadata.fromJson(
        {'pageNumber': 2, 'pageSize': 15, 'total': 45, 'pages': 3},
        pageKey: 'pageNumber',
        limitKey: 'pageSize',
        totalItemsKey: 'total',
        totalPagesKey: 'pages',
      );

      expect(meta.currentPage, 2);
      expect(meta.itemsPerPage, 15);
      expect(meta.totalItems, 45);
      expect(meta.totalPages, 3);
      expect(meta.hasNextPage, isTrue);
      expect(meta.hasPrevPage, isTrue);
    });

    test('custom keys fall back to defaults when absent', () {
      final meta = PaginationMetadata.fromJson(
        {},
        pageKey: 'pageNumber',
        limitKey: 'pageSize',
        totalItemsKey: 'total',
        totalPagesKey: 'pages',
      );

      expect(meta.currentPage, 1);
      expect(meta.itemsPerPage, 10);
      expect(meta.totalItems, 0);
      expect(meta.totalPages, 1);
    });
  });
}
