import 'package:result_kit/result_kit.dart';
import 'package:test/test.dart';

const _meta = PaginationMetadata(
  currentPage: 1,
  itemsPerPage: 10,
  totalItems: 25,
  totalPages: 3,
  hasNextPage: true,
  hasPrevPage: false,
);

const _lastPageMeta = PaginationMetadata(
  currentPage: 3,
  itemsPerPage: 10,
  totalItems: 25,
  totalPages: 3,
  hasNextPage: false,
  hasPrevPage: true,
);

const _failure = Failure.network('offline');

void main() {
  group('PaginatedDataState constructors', () {
    test('initial', () => expect(const PaginatedDataState<int>.initial(), isA<PaginatedInitial<int>>()));
    test('loading', () => expect(const PaginatedDataState<int>.loading(), isA<PaginatedLoading<int>>()));
    test('success carries items and metadata', () {
      const state = PaginatedDataState.success(items: [1, 2], metadata: _meta);
      expect((state as PaginatedSuccess).items, [1, 2]);
      expect(state.metadata, _meta);
    });
    test('success defaults isLoadingMore to false', () {
      const state = PaginatedDataState<int>.success(items: [], metadata: _meta);
      expect((state as PaginatedSuccess).isLoadingMore, isFalse);
    });
    test('empty', () => expect(const PaginatedDataState<int>.empty(), isA<PaginatedEmpty<int>>()));
    test('failure carries failure', () {
      const state = PaginatedDataState<int>.failure(_failure);
      expect((state as PaginatedFailure).failure, _failure);
    });
  });

  group('PaginatedDataStateExtensions — boolean flags', () {
    test('isInitial', () {
      expect(const PaginatedDataState<int>.initial().isInitial, isTrue);
      expect(const PaginatedDataState<int>.loading().isInitial, isFalse);
    });

    test('isLoading', () {
      expect(const PaginatedDataState<int>.loading().isLoading, isTrue);
      expect(const PaginatedDataState<int>.initial().isLoading, isFalse);
    });

    test('isSuccess', () {
      expect(const PaginatedDataState<int>.success(items: [], metadata: _meta).isSuccess, isTrue);
      expect(const PaginatedDataState<int>.loading().isSuccess, isFalse);
    });

    test('isEmpty', () {
      expect(const PaginatedDataState<int>.empty().isEmpty, isTrue);
      expect(const PaginatedDataState<int>.loading().isEmpty, isFalse);
    });

    test('isFailure', () {
      expect(const PaginatedDataState<int>.failure(_failure).isFailure, isTrue);
      expect(const PaginatedDataState<int>.loading().isFailure, isFalse);
    });
  });

  group('PaginatedDataStateExtensions — data accessors', () {
    test('items returns list on success', () {
      const state = PaginatedDataState.success(items: [1, 2, 3], metadata: _meta);
      expect(state.items, [1, 2, 3]);
    });

    test('items returns null on non-success states', () {
      expect(const PaginatedDataState<int>.initial().items, isNull);
      expect(const PaginatedDataState<int>.loading().items, isNull);
      expect(const PaginatedDataState<int>.empty().items, isNull);
      expect(const PaginatedDataState<int>.failure(_failure).items, isNull);
    });

    test('metadata returns metadata on success', () {
      const state = PaginatedDataState<int>.success(items: [], metadata: _meta);
      expect(state.metadata, _meta);
    });

    test('metadata returns null on non-success states', () {
      expect(const PaginatedDataState<int>.initial().metadata, isNull);
      expect(const PaginatedDataState<int>.loading().metadata, isNull);
    });

    test('hasMore is true when metadata.hasNextPage is true', () {
      const state = PaginatedDataState<int>.success(items: [], metadata: _meta);
      expect(state.hasMore, isTrue);
    });

    test('hasMore is false on last page', () {
      const state = PaginatedDataState<int>.success(items: [], metadata: _lastPageMeta);
      expect(state.hasMore, isFalse);
    });

    test('hasMore is false on non-success states', () {
      expect(const PaginatedDataState<int>.initial().hasMore, isFalse);
      expect(const PaginatedDataState<int>.loading().hasMore, isFalse);
    });

    test('isLoadingMore is true when set', () {
      const state = PaginatedDataState<int>.success(
        items: [],
        metadata: _meta,
        isLoadingMore: true,
      );
      expect(state.isLoadingMore, isTrue);
    });

    test('isLoadingMore is false on non-success states', () {
      expect(const PaginatedDataState<int>.initial().isLoadingMore, isFalse);
      expect(const PaginatedDataState<int>.loading().isLoadingMore, isFalse);
    });

    test('failure returns Failure on failure state', () {
      expect(const PaginatedDataState<int>.failure(_failure).failure, _failure);
    });

    test('failure returns null on non-failure states', () {
      expect(const PaginatedDataState<int>.initial().failure, isNull);
      expect(const PaginatedDataState<int>.success(items: [], metadata: _meta).failure, isNull);
    });

    test('errorMessage returns message on failure state', () {
      expect(const PaginatedDataState<int>.failure(_failure).errorMessage, 'offline');
    });
  });
}
