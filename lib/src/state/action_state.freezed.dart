// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActionState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActionState<$T>()';
}


}

/// @nodoc
class $ActionStateCopyWith<T,$Res>  {
$ActionStateCopyWith(ActionState<T> _, $Res Function(ActionState<T>) __);
}


/// Adds pattern-matching-related methods to [ActionState].
extension ActionStatePatterns<T> on ActionState<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ActionInitial<T> value)?  initial,TResult Function( ActionLoading<T> value)?  loading,TResult Function( ActionSuccess<T> value)?  success,TResult Function( ActionFailure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ActionInitial() when initial != null:
return initial(_that);case ActionLoading() when loading != null:
return loading(_that);case ActionSuccess() when success != null:
return success(_that);case ActionFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ActionInitial<T> value)  initial,required TResult Function( ActionLoading<T> value)  loading,required TResult Function( ActionSuccess<T> value)  success,required TResult Function( ActionFailure<T> value)  failure,}){
final _that = this;
switch (_that) {
case ActionInitial():
return initial(_that);case ActionLoading():
return loading(_that);case ActionSuccess():
return success(_that);case ActionFailure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ActionInitial<T> value)?  initial,TResult? Function( ActionLoading<T> value)?  loading,TResult? Function( ActionSuccess<T> value)?  success,TResult? Function( ActionFailure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case ActionInitial() when initial != null:
return initial(_that);case ActionLoading() when loading != null:
return loading(_that);case ActionSuccess() when success != null:
return success(_that);case ActionFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T? data)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ActionInitial() when initial != null:
return initial();case ActionLoading() when loading != null:
return loading();case ActionSuccess() when success != null:
return success(_that.data);case ActionFailure() when failure != null:
return failure(_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T? data)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case ActionInitial():
return initial();case ActionLoading():
return loading();case ActionSuccess():
return success(_that.data);case ActionFailure():
return failure(_that.failure);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T? data)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case ActionInitial() when initial != null:
return initial();case ActionLoading() when loading != null:
return loading();case ActionSuccess() when success != null:
return success(_that.data);case ActionFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ActionInitial<T> implements ActionState<T> {
  const ActionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActionState<$T>.initial()';
}


}




/// @nodoc


class ActionLoading<T> implements ActionState<T> {
  const ActionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActionState<$T>.loading()';
}


}




/// @nodoc


class ActionSuccess<T> implements ActionState<T> {
  const ActionSuccess([this.data]);
  

 final  T? data;

/// Create a copy of ActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionSuccessCopyWith<T, ActionSuccess<T>> get copyWith => _$ActionSuccessCopyWithImpl<T, ActionSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ActionState<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ActionSuccessCopyWith<T,$Res> implements $ActionStateCopyWith<T, $Res> {
  factory $ActionSuccessCopyWith(ActionSuccess<T> value, $Res Function(ActionSuccess<T>) _then) = _$ActionSuccessCopyWithImpl;
@useResult
$Res call({
 T? data
});




}
/// @nodoc
class _$ActionSuccessCopyWithImpl<T,$Res>
    implements $ActionSuccessCopyWith<T, $Res> {
  _$ActionSuccessCopyWithImpl(this._self, this._then);

  final ActionSuccess<T> _self;
  final $Res Function(ActionSuccess<T>) _then;

/// Create a copy of ActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ActionSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

/// @nodoc


class ActionFailure<T> implements ActionState<T> {
  const ActionFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of ActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionFailureCopyWith<T, ActionFailure<T>> get copyWith => _$ActionFailureCopyWithImpl<T, ActionFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionFailure<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ActionState<$T>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ActionFailureCopyWith<T,$Res> implements $ActionStateCopyWith<T, $Res> {
  factory $ActionFailureCopyWith(ActionFailure<T> value, $Res Function(ActionFailure<T>) _then) = _$ActionFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$ActionFailureCopyWithImpl<T,$Res>
    implements $ActionFailureCopyWith<T, $Res> {
  _$ActionFailureCopyWithImpl(this._self, this._then);

  final ActionFailure<T> _self;
  final $Res Function(ActionFailure<T>) _then;

/// Create a copy of ActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ActionFailure<T>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of ActionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
