// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DataState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataState<$T>()';
}


}

/// @nodoc
class $DataStateCopyWith<T,$Res>  {
$DataStateCopyWith(DataState<T> _, $Res Function(DataState<T>) __);
}


/// Adds pattern-matching-related methods to [DataState].
extension DataStatePatterns<T> on DataState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DataInitial<T> value)?  initial,TResult Function( DataLoading<T> value)?  loading,TResult Function( DataSuccess<T> value)?  success,TResult Function( DataEmpty<T> value)?  empty,TResult Function( DataError<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DataInitial() when initial != null:
return initial(_that);case DataLoading() when loading != null:
return loading(_that);case DataSuccess() when success != null:
return success(_that);case DataEmpty() when empty != null:
return empty(_that);case DataError() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DataInitial<T> value)  initial,required TResult Function( DataLoading<T> value)  loading,required TResult Function( DataSuccess<T> value)  success,required TResult Function( DataEmpty<T> value)  empty,required TResult Function( DataError<T> value)  failure,}){
final _that = this;
switch (_that) {
case DataInitial():
return initial(_that);case DataLoading():
return loading(_that);case DataSuccess():
return success(_that);case DataEmpty():
return empty(_that);case DataError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DataInitial<T> value)?  initial,TResult? Function( DataLoading<T> value)?  loading,TResult? Function( DataSuccess<T> value)?  success,TResult? Function( DataEmpty<T> value)?  empty,TResult? Function( DataError<T> value)?  failure,}){
final _that = this;
switch (_that) {
case DataInitial() when initial != null:
return initial(_that);case DataLoading() when loading != null:
return loading(_that);case DataSuccess() when success != null:
return success(_that);case DataEmpty() when empty != null:
return empty(_that);case DataError() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T item)?  success,TResult Function()?  empty,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DataInitial() when initial != null:
return initial();case DataLoading() when loading != null:
return loading();case DataSuccess() when success != null:
return success(_that.item);case DataEmpty() when empty != null:
return empty();case DataError() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T item)  success,required TResult Function()  empty,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case DataInitial():
return initial();case DataLoading():
return loading();case DataSuccess():
return success(_that.item);case DataEmpty():
return empty();case DataError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T item)?  success,TResult? Function()?  empty,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case DataInitial() when initial != null:
return initial();case DataLoading() when loading != null:
return loading();case DataSuccess() when success != null:
return success(_that.item);case DataEmpty() when empty != null:
return empty();case DataError() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class DataInitial<T> implements DataState<T> {
  const DataInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataState<$T>.initial()';
}


}




/// @nodoc


class DataLoading<T> implements DataState<T> {
  const DataLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataState<$T>.loading()';
}


}




/// @nodoc


class DataSuccess<T> implements DataState<T> {
  const DataSuccess(this.item);
  

 final  T item;

/// Create a copy of DataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataSuccessCopyWith<T, DataSuccess<T>> get copyWith => _$DataSuccessCopyWithImpl<T, DataSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataSuccess<T>&&const DeepCollectionEquality().equals(other.item, item));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(item));

@override
String toString() {
  return 'DataState<$T>.success(item: $item)';
}


}

/// @nodoc
abstract mixin class $DataSuccessCopyWith<T,$Res> implements $DataStateCopyWith<T, $Res> {
  factory $DataSuccessCopyWith(DataSuccess<T> value, $Res Function(DataSuccess<T>) _then) = _$DataSuccessCopyWithImpl;
@useResult
$Res call({
 T item
});




}
/// @nodoc
class _$DataSuccessCopyWithImpl<T,$Res>
    implements $DataSuccessCopyWith<T, $Res> {
  _$DataSuccessCopyWithImpl(this._self, this._then);

  final DataSuccess<T> _self;
  final $Res Function(DataSuccess<T>) _then;

/// Create a copy of DataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = freezed,}) {
  return _then(DataSuccess<T>(
freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class DataEmpty<T> implements DataState<T> {
  const DataEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataEmpty<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataState<$T>.empty()';
}


}




/// @nodoc


class DataError<T> implements DataState<T> {
  const DataError(this.failure);
  

 final  Failure failure;

/// Create a copy of DataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataErrorCopyWith<T, DataError<T>> get copyWith => _$DataErrorCopyWithImpl<T, DataError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataError<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'DataState<$T>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $DataErrorCopyWith<T,$Res> implements $DataStateCopyWith<T, $Res> {
  factory $DataErrorCopyWith(DataError<T> value, $Res Function(DataError<T>) _then) = _$DataErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$DataErrorCopyWithImpl<T,$Res>
    implements $DataErrorCopyWith<T, $Res> {
  _$DataErrorCopyWithImpl(this._self, this._then);

  final DataError<T> _self;
  final $Res Function(DataError<T>) _then;

/// Create a copy of DataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(DataError<T>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of DataState
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
