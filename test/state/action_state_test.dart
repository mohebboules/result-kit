import 'package:result_kit/result_kit.dart';
import 'package:test/test.dart';

void main() {
  const failure = Failure.server('action failed');

  group('ActionState constructors', () {
    test('initial', () => expect(const ActionState<int>.initial(), isA<ActionInitial<int>>()));
    test('loading', () => expect(const ActionState<int>.loading(), isA<ActionLoading<int>>()));
    test('success without data', () {
      expect(const ActionState<int>.success(), isA<ActionSuccess<int>>());
      expect(const ActionState<int>.success().data, isNull);
    });
    test('success with data', () {
      const state = ActionState.success(42);
      expect((state as ActionSuccess).data, 42);
    });
    test('failure carries failure', () {
      const state = ActionState<int>.failure(failure);
      expect((state as ActionFailure).failure, failure);
    });
  });

  group('ActionStateExtensions — boolean flags', () {
    test('isInitial', () {
      expect(const ActionState<int>.initial().isInitial, isTrue);
      expect(const ActionState<int>.loading().isInitial, isFalse);
    });

    test('isLoading', () {
      expect(const ActionState<int>.loading().isLoading, isTrue);
      expect(const ActionState<int>.initial().isLoading, isFalse);
    });

    test('isSuccess', () {
      expect(const ActionState<int>.success().isSuccess, isTrue);
      expect(const ActionState<int>.loading().isSuccess, isFalse);
    });

    test('isFailure', () {
      expect(const ActionState<int>.failure(failure).isFailure, isTrue);
      expect(const ActionState<int>.loading().isFailure, isFalse);
    });
  });

  group('ActionStateExtensions — data accessors', () {
    test('data returns value on success', () {
      expect(const ActionState.success('done').data, 'done');
    });

    test('data returns null on non-success states', () {
      expect(const ActionState<String>.initial().data, isNull);
      expect(const ActionState<String>.loading().data, isNull);
      expect(const ActionState<String>.failure(failure).data, isNull);
    });

    test('failure returns Failure on failure state', () {
      expect(const ActionState<int>.failure(failure).failure, failure);
    });

    test('failure returns null on non-failure states', () {
      expect(const ActionState<int>.initial().failure, isNull);
      expect(const ActionState<int>.loading().failure, isNull);
      expect(const ActionState<int>.success().failure, isNull);
    });

    test('errorMessage returns message on failure state', () {
      expect(const ActionState<int>.failure(failure).errorMessage, 'action failed');
    });

    test('errorMessage returns null on non-failure states', () {
      expect(const ActionState<int>.initial().errorMessage, isNull);
      expect(const ActionState<int>.success().errorMessage, isNull);
    });
  });
}
