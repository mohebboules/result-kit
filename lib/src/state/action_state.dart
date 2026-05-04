import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
class ActionState<T> with _$ActionState<T> {
  const factory ActionState.initial() = ActionInitial<T>;
  const factory ActionState.loading() = ActionLoading<T>;
  const factory ActionState.success([T? data]) = ActionSuccess<T>;
  const factory ActionState.failure(String message) = ActionFailure<T>;
}

extension ActionStateExtensions<T> on ActionState<T> {
  bool get isInitial => this is ActionInitial<T>;
  bool get isLoading => this is ActionLoading<T>;
  bool get isSuccess => this is ActionSuccess<T>;
  bool get isFailure => this is ActionFailure<T>;

  String? get errorMessage => isFailure ? (this as ActionFailure<T>).message : null;
  T? get data => isSuccess ? (this as ActionSuccess<T>).data : null;
}
