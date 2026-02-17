// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../movie_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetailsDto {
  int get id;
  String get title;
  int get budget;
  int get revenue;

  /// Create a copy of MovieDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovieDetailsDtoCopyWith<MovieDetailsDto> get copyWith =>
      _$MovieDetailsDtoCopyWithImpl<MovieDetailsDto>(
          this as MovieDetailsDto, _$identity);

  /// Serializes this MovieDetailsDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovieDetailsDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, budget, revenue);

  @override
  String toString() {
    return 'MovieDetailsDto(id: $id, title: $title, budget: $budget, revenue: $revenue)';
  }
}

/// @nodoc
abstract mixin class $MovieDetailsDtoCopyWith<$Res> {
  factory $MovieDetailsDtoCopyWith(
          MovieDetailsDto value, $Res Function(MovieDetailsDto) _then) =
      _$MovieDetailsDtoCopyWithImpl;
  @useResult
  $Res call({int id, String title, int budget, int revenue});
}

/// @nodoc
class _$MovieDetailsDtoCopyWithImpl<$Res>
    implements $MovieDetailsDtoCopyWith<$Res> {
  _$MovieDetailsDtoCopyWithImpl(this._self, this._then);

  final MovieDetailsDto _self;
  final $Res Function(MovieDetailsDto) _then;

  /// Create a copy of MovieDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? budget = null,
    Object? revenue = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _self.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _self.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [MovieDetailsDto].
extension MovieDetailsDtoPatterns on MovieDetailsDto {
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
    TResult Function(_MovieDetailsDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovieDetailsDto() when $default != null:
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
    TResult Function(_MovieDetailsDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetailsDto():
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
    TResult? Function(_MovieDetailsDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetailsDto() when $default != null:
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
    TResult Function(int id, String title, int budget, int revenue)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovieDetailsDto() when $default != null:
        return $default(_that.id, _that.title, _that.budget, _that.revenue);
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
    TResult Function(int id, String title, int budget, int revenue) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetailsDto():
        return $default(_that.id, _that.title, _that.budget, _that.revenue);
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
    TResult? Function(int id, String title, int budget, int revenue)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetailsDto() when $default != null:
        return $default(_that.id, _that.title, _that.budget, _that.revenue);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MovieDetailsDto extends MovieDetailsDto {
  const _MovieDetailsDto(
      {required this.id,
      required this.title,
      required this.budget,
      required this.revenue})
      : super._();
  factory _MovieDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsDtoFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final int budget;
  @override
  final int revenue;

  /// Create a copy of MovieDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MovieDetailsDtoCopyWith<_MovieDetailsDto> get copyWith =>
      __$MovieDetailsDtoCopyWithImpl<_MovieDetailsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MovieDetailsDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieDetailsDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, budget, revenue);

  @override
  String toString() {
    return 'MovieDetailsDto(id: $id, title: $title, budget: $budget, revenue: $revenue)';
  }
}

/// @nodoc
abstract mixin class _$MovieDetailsDtoCopyWith<$Res>
    implements $MovieDetailsDtoCopyWith<$Res> {
  factory _$MovieDetailsDtoCopyWith(
          _MovieDetailsDto value, $Res Function(_MovieDetailsDto) _then) =
      __$MovieDetailsDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String title, int budget, int revenue});
}

/// @nodoc
class __$MovieDetailsDtoCopyWithImpl<$Res>
    implements _$MovieDetailsDtoCopyWith<$Res> {
  __$MovieDetailsDtoCopyWithImpl(this._self, this._then);

  final _MovieDetailsDto _self;
  final $Res Function(_MovieDetailsDto) _then;

  /// Create a copy of MovieDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? budget = null,
    Object? revenue = null,
  }) {
    return _then(_MovieDetailsDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _self.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _self.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
