// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationMetadata {
  int get currentPage;
  int get itemsPerPage;
  int get totalItems;
  int get totalPages;
  bool get hasNextPage;
  bool get hasPrevPage;

  /// Create a copy of PaginationMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationMetadataCopyWith<PaginationMetadata> get copyWith =>
      _$PaginationMetadataCopyWithImpl<PaginationMetadata>(this as PaginationMetadata, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationMetadata &&
            (identical(other.currentPage, currentPage) || other.currentPage == currentPage) &&
            (identical(other.itemsPerPage, itemsPerPage) || other.itemsPerPage == itemsPerPage) &&
            (identical(other.totalItems, totalItems) || other.totalItems == totalItems) &&
            (identical(other.totalPages, totalPages) || other.totalPages == totalPages) &&
            (identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage) &&
            (identical(other.hasPrevPage, hasPrevPage) || other.hasPrevPage == hasPrevPage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, itemsPerPage, totalItems, totalPages, hasNextPage, hasPrevPage);

  @override
  String toString() {
    return 'PaginationMetadata(currentPage: $currentPage, itemsPerPage: $itemsPerPage, totalItems: $totalItems, totalPages: $totalPages, hasNextPage: $hasNextPage, hasPrevPage: $hasPrevPage)';
  }
}

/// @nodoc
abstract mixin class $PaginationMetadataCopyWith<$Res> {
  factory $PaginationMetadataCopyWith(PaginationMetadata value, $Res Function(PaginationMetadata) _then) =
      _$PaginationMetadataCopyWithImpl;
  @useResult
  $Res call({int currentPage, int itemsPerPage, int totalItems, int totalPages, bool hasNextPage, bool hasPrevPage});
}

/// @nodoc
class _$PaginationMetadataCopyWithImpl<$Res> implements $PaginationMetadataCopyWith<$Res> {
  _$PaginationMetadataCopyWithImpl(this._self, this._then);

  final PaginationMetadata _self;
  final $Res Function(PaginationMetadata) _then;

  /// Create a copy of PaginationMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? itemsPerPage = null,
    Object? totalItems = null,
    Object? totalPages = null,
    Object? hasNextPage = null,
    Object? hasPrevPage = null,
  }) {
    return _then(_self.copyWith(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _self.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _self.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrevPage: null == hasPrevPage
          ? _self.hasPrevPage
          : hasPrevPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaginationMetadata].
extension PaginationMetadataPatterns on PaginationMetadata {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PaginationMetadata value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginationMetadata() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PaginationMetadata value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationMetadata():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PaginationMetadata value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationMetadata() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int currentPage, int itemsPerPage, int totalItems, int totalPages, bool hasNextPage, bool hasPrevPage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginationMetadata() when $default != null:
        return $default(_that.currentPage, _that.itemsPerPage, _that.totalItems, _that.totalPages, _that.hasNextPage,
            _that.hasPrevPage);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int currentPage, int itemsPerPage, int totalItems, int totalPages, bool hasNextPage, bool hasPrevPage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationMetadata():
        return $default(_that.currentPage, _that.itemsPerPage, _that.totalItems, _that.totalPages, _that.hasNextPage,
            _that.hasPrevPage);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int currentPage, int itemsPerPage, int totalItems, int totalPages, bool hasNextPage, bool hasPrevPage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationMetadata() when $default != null:
        return $default(_that.currentPage, _that.itemsPerPage, _that.totalItems, _that.totalPages, _that.hasNextPage,
            _that.hasPrevPage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PaginationMetadata implements PaginationMetadata {
  const _PaginationMetadata(
      {required this.currentPage,
      required this.itemsPerPage,
      required this.totalItems,
      required this.totalPages,
      required this.hasNextPage,
      required this.hasPrevPage});

  @override
  final int currentPage;
  @override
  final int itemsPerPage;
  @override
  final int totalItems;
  @override
  final int totalPages;
  @override
  final bool hasNextPage;
  @override
  final bool hasPrevPage;

  /// Create a copy of PaginationMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginationMetadataCopyWith<_PaginationMetadata> get copyWith =>
      __$PaginationMetadataCopyWithImpl<_PaginationMetadata>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationMetadata &&
            (identical(other.currentPage, currentPage) || other.currentPage == currentPage) &&
            (identical(other.itemsPerPage, itemsPerPage) || other.itemsPerPage == itemsPerPage) &&
            (identical(other.totalItems, totalItems) || other.totalItems == totalItems) &&
            (identical(other.totalPages, totalPages) || other.totalPages == totalPages) &&
            (identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage) &&
            (identical(other.hasPrevPage, hasPrevPage) || other.hasPrevPage == hasPrevPage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, itemsPerPage, totalItems, totalPages, hasNextPage, hasPrevPage);

  @override
  String toString() {
    return 'PaginationMetadata(currentPage: $currentPage, itemsPerPage: $itemsPerPage, totalItems: $totalItems, totalPages: $totalPages, hasNextPage: $hasNextPage, hasPrevPage: $hasPrevPage)';
  }
}

/// @nodoc
abstract mixin class _$PaginationMetadataCopyWith<$Res> implements $PaginationMetadataCopyWith<$Res> {
  factory _$PaginationMetadataCopyWith(_PaginationMetadata value, $Res Function(_PaginationMetadata) _then) =
      __$PaginationMetadataCopyWithImpl;
  @override
  @useResult
  $Res call({int currentPage, int itemsPerPage, int totalItems, int totalPages, bool hasNextPage, bool hasPrevPage});
}

/// @nodoc
class __$PaginationMetadataCopyWithImpl<$Res> implements _$PaginationMetadataCopyWith<$Res> {
  __$PaginationMetadataCopyWithImpl(this._self, this._then);

  final _PaginationMetadata _self;
  final $Res Function(_PaginationMetadata) _then;

  /// Create a copy of PaginationMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? itemsPerPage = null,
    Object? totalItems = null,
    Object? totalPages = null,
    Object? hasNextPage = null,
    Object? hasPrevPage = null,
  }) {
    return _then(_PaginationMetadata(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _self.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _self.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrevPage: null == hasPrevPage
          ? _self.hasPrevPage
          : hasPrevPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
