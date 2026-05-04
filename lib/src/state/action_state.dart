import 'package:freezed_annotation/freezed_annotation.dart';

import '../result/failure.dart';

part 'action_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
class ActionState<T> with _$ActionState<T> {
  const factory ActionState.initial() = ActionInitial<T>;
  const factory ActionState.loading() = ActionLoading<T>;

  /// [data] is `null` for `void` actions; typed for actions that return data.
  const factory ActionState.success([T? data]) = ActionSuccess<T>;
  const factory ActionState.failure(Failure message) = ActionFailure<T>;
}

extension ActionStateExtensions<T> on ActionState<T> {
  bool get isInitial => this is ActionInitial<T>;
  bool get isLoading => this is ActionLoading<T>;
  bool get isSuccess => this is ActionSuccess<T>;
  bool get isFailure => this is ActionFailure<T>;

  /// The failure, or `null` if the state is not [ActionFailure].
  Failure? get failure => isFailure ? (this as ActionFailure<T>).failure : null;

  /// Convenience message from [failure], or `null` if not a failure state.
  String? get errorMessage => failure?.message;

  /// The success data, or `null` if the state is not [ActionSuccess].
  T? get data => isSuccess ? (this as ActionSuccess<T>).data : null;
}
