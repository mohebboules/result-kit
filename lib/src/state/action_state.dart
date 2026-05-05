import 'package:freezed_annotation/freezed_annotation.dart';

import '../result/failure.dart';

part 'action_state.freezed.dart';

/// A four-state machine for async mutation operations (create, update, delete).
///
/// Typical flow:
/// [ActionState.initial] → [ActionState.loading] →
/// [ActionState.success] | [ActionState.failure]
@Freezed(genericArgumentFactories: true)
class ActionState<T> with _$ActionState<T> {
  /// The initial state before any action is triggered.
  const factory ActionState.initial() = ActionInitial<T>;

  /// An action is in progress.
  const factory ActionState.loading() = ActionLoading<T>;

  /// The action completed successfully.
  ///
  /// [data] is `null` for fire-and-forget actions; typed for actions that return a value.
  const factory ActionState.success([T? data]) = ActionSuccess<T>;

  /// The action failed with a typed [failure].
  const factory ActionState.failure(Failure failure) = ActionFailure<T>;
}

/// Extensions on [ActionState] for convenient state inspection without pattern-matching.
extension ActionStateExtensions<T> on ActionState<T> {
  /// Whether this is [ActionInitial].
  bool get isInitial => this is ActionInitial<T>;

  /// Whether this is [ActionLoading].
  bool get isLoading => this is ActionLoading<T>;

  /// Whether this is [ActionSuccess].
  bool get isSuccess => this is ActionSuccess<T>;

  /// Whether this is [ActionFailure].
  bool get isFailure => this is ActionFailure<T>;

  /// The failure, or `null` if the state is not [ActionFailure].
  Failure? get failure => isFailure ? (this as ActionFailure<T>).failure : null;

  /// Convenience message from [failure], or `null` if not a failure state.
  String? get errorMessage => failure?.message;

  /// The success data, or `null` if the state is not [ActionSuccess].
  T? get data => isSuccess ? (this as ActionSuccess<T>).data : null;
}
