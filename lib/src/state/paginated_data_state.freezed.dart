// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginatedDataState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedDataState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaginatedDataState<$T>()';
}


}

/// @nodoc
class $PaginatedDataStateCopyWith<T,$Res>  {
$PaginatedDataStateCopyWith(PaginatedDataState<T> _, $Res Function(PaginatedDataState<T>) __);
}


/// Adds pattern-matching-related methods to [PaginatedDataState].
extension PaginatedDataStatePatterns<T> on PaginatedDataState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PaginatedInitial<T> value)?  initial,TResult Function( PaginatedLoading<T> value)?  loading,TResult Function( PaginatedSuccess<T> value)?  success,TResult Function( PaginatedEmpty<T> value)?  empty,TResult Function( PaginatedFailure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PaginatedInitial() when initial != null:
return initial(_that);case PaginatedLoading() when loading != null:
return loading(_that);case PaginatedSuccess() when success != null:
return success(_that);case PaginatedEmpty() when empty != null:
return empty(_that);case PaginatedFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PaginatedInitial<T> value)  initial,required TResult Function( PaginatedLoading<T> value)  loading,required TResult Function( PaginatedSuccess<T> value)  success,required TResult Function( PaginatedEmpty<T> value)  empty,required TResult Function( PaginatedFailure<T> value)  failure,}){
final _that = this;
switch (_that) {
case PaginatedInitial():
return initial(_that);case PaginatedLoading():
return loading(_that);case PaginatedSuccess():
return success(_that);case PaginatedEmpty():
return empty(_that);case PaginatedFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PaginatedInitial<T> value)?  initial,TResult? Function( PaginatedLoading<T> value)?  loading,TResult? Function( PaginatedSuccess<T> value)?  success,TResult? Function( PaginatedEmpty<T> value)?  empty,TResult? Function( PaginatedFailure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case PaginatedInitial() when initial != null:
return initial(_that);case PaginatedLoading() when loading != null:
return loading(_that);case PaginatedSuccess() when success != null:
return success(_that);case PaginatedEmpty() when empty != null:
return empty(_that);case PaginatedFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<T> items,  PaginationMetadata metadata,  bool isLoadingMore)?  success,TResult Function()?  empty,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PaginatedInitial() when initial != null:
return initial();case PaginatedLoading() when loading != null:
return loading();case PaginatedSuccess() when success != null:
return success(_that.items,_that.metadata,_that.isLoadingMore);case PaginatedEmpty() when empty != null:
return empty();case PaginatedFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<T> items,  PaginationMetadata metadata,  bool isLoadingMore)  success,required TResult Function()  empty,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case PaginatedInitial():
return initial();case PaginatedLoading():
return loading();case PaginatedSuccess():
return success(_that.items,_that.metadata,_that.isLoadingMore);case PaginatedEmpty():
return empty();case PaginatedFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<T> items,  PaginationMetadata metadata,  bool isLoadingMore)?  success,TResult? Function()?  empty,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case PaginatedInitial() when initial != null:
return initial();case PaginatedLoading() when loading != null:
return loading();case PaginatedSuccess() when success != null:
return success(_that.items,_that.metadata,_that.isLoadingMore);case PaginatedEmpty() when empty != null:
return empty();case PaginatedFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class PaginatedInitial<T> implements PaginatedDataState<T> {
  const PaginatedInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaginatedDataState<$T>.initial()';
}


}




/// @nodoc


class PaginatedLoading<T> implements PaginatedDataState<T> {
  const PaginatedLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaginatedDataState<$T>.loading()';
}


}




/// @nodoc


class PaginatedSuccess<T> implements PaginatedDataState<T> {
  const PaginatedSuccess({required final  List<T> items, required this.metadata, this.isLoadingMore = false}): _items = items;
  

 final  List<T> _items;
 List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  PaginationMetadata metadata;
@JsonKey() final  bool isLoadingMore;

/// Create a copy of PaginatedDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedSuccessCopyWith<T, PaginatedSuccess<T>> get copyWith => _$PaginatedSuccessCopyWithImpl<T, PaginatedSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedSuccess<T>&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),metadata,isLoadingMore);

@override
String toString() {
  return 'PaginatedDataState<$T>.success(items: $items, metadata: $metadata, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $PaginatedSuccessCopyWith<T,$Res> implements $PaginatedDataStateCopyWith<T, $Res> {
  factory $PaginatedSuccessCopyWith(PaginatedSuccess<T> value, $Res Function(PaginatedSuccess<T>) _then) = _$PaginatedSuccessCopyWithImpl;
@useResult
$Res call({
 List<T> items, PaginationMetadata metadata, bool isLoadingMore
});


$PaginationMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$PaginatedSuccessCopyWithImpl<T,$Res>
    implements $PaginatedSuccessCopyWith<T, $Res> {
  _$PaginatedSuccessCopyWithImpl(this._self, this._then);

  final PaginatedSuccess<T> _self;
  final $Res Function(PaginatedSuccess<T>) _then;

/// Create a copy of PaginatedDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? metadata = null,Object? isLoadingMore = null,}) {
  return _then(PaginatedSuccess<T>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as PaginationMetadata,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PaginatedDataState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetadataCopyWith<$Res> get metadata {
  
  return $PaginationMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

/// @nodoc


class PaginatedEmpty<T> implements PaginatedDataState<T> {
  const PaginatedEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedEmpty<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaginatedDataState<$T>.empty()';
}


}




/// @nodoc


class PaginatedFailure<T> implements PaginatedDataState<T> {
  const PaginatedFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of PaginatedDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedFailureCopyWith<T, PaginatedFailure<T>> get copyWith => _$PaginatedFailureCopyWithImpl<T, PaginatedFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedFailure<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'PaginatedDataState<$T>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $PaginatedFailureCopyWith<T,$Res> implements $PaginatedDataStateCopyWith<T, $Res> {
  factory $PaginatedFailureCopyWith(PaginatedFailure<T> value, $Res Function(PaginatedFailure<T>) _then) = _$PaginatedFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$PaginatedFailureCopyWithImpl<T,$Res>
    implements $PaginatedFailureCopyWith<T, $Res> {
  _$PaginatedFailureCopyWithImpl(this._self, this._then);

  final PaginatedFailure<T> _self;
  final $Res Function(PaginatedFailure<T>) _then;

/// Create a copy of PaginatedDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(PaginatedFailure<T>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of PaginatedDataState
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
