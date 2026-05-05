import 'package:result_kit/result_kit.dart';
import 'package:test/test.dart';

void main() {
  const failure = Failure.server('load failed');

  group('DataState constructors', () {
    test('initial', () => expect(const DataState<int>.initial(), isA<DataInitial<int>>()));
    test('loading', () => expect(const DataState<int>.loading(), isA<DataLoading<int>>()));
    test('success carries item', () {
      const state = DataState.success(99);
      expect((state as DataSuccess).item, 99);
    });
    test('empty', () => expect(const DataState<int>.empty(), isA<DataEmpty<int>>()));
    test('failure carries failure', () {
      const state = DataState<int>.failure(failure);
      expect((state as DataFailure).failure, failure);
    });
  });

  group('DataStateExtensions — boolean flags', () {
    test('isInitial', () {
      expect(const DataState<int>.initial().isInitial, isTrue);
      expect(const DataState<int>.loading().isInitial, isFalse);
    });

    test('isLoading', () {
      expect(const DataState<int>.loading().isLoading, isTrue);
      expect(const DataState<int>.initial().isLoading, isFalse);
    });

    test('isSuccess', () {
      expect(const DataState.success(1).isSuccess, isTrue);
      expect(const DataState<int>.loading().isSuccess, isFalse);
    });

    test('isEmpty', () {
      expect(const DataState<int>.empty().isEmpty, isTrue);
      expect(const DataState<int>.loading().isEmpty, isFalse);
    });

    test('isFailure', () {
      expect(const DataState<int>.failure(failure).isFailure, isTrue);
      expect(const DataState<int>.loading().isFailure, isFalse);
    });
  });

  group('DataStateExtensions — data accessors', () {
    test('item returns value on success', () {
      expect(const DataState.success('hi').item, 'hi');
    });

    test('item returns null on non-success states', () {
      expect(const DataState<String>.initial().item, isNull);
      expect(const DataState<String>.loading().item, isNull);
      expect(const DataState<String>.empty().item, isNull);
      expect(const DataState<String>.failure(failure).item, isNull);
    });

    test('failure returns Failure on error state', () {
      expect(const DataState<int>.failure(failure).failure, failure);
    });

    test('failure returns null on non-error states', () {
      expect(const DataState<int>.initial().failure, isNull);
      expect(const DataState<int>.loading().failure, isNull);
      expect(const DataState.success(1).failure, isNull);
      expect(const DataState<int>.empty().failure, isNull);
    });

    test('errorMessage returns message on error state', () {
      expect(const DataState<int>.failure(failure).errorMessage, 'load failed');
    });

    test('errorMessage returns null on non-error states', () {
      expect(const DataState<int>.initial().errorMessage, isNull);
      expect(const DataState<int>.loading().errorMessage, isNull);
    });
  });
}
