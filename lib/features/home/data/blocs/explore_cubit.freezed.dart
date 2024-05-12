// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExploreState _$ExploreStateFromJson(Map<String, dynamic> json) {
  return _ExploreState.fromJson(json);
}

/// @nodoc
mixin _$ExploreState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ExploreModel> get blogs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExploreStateCopyWith<ExploreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreStateCopyWith<$Res> {
  factory $ExploreStateCopyWith(
          ExploreState value, $Res Function(ExploreState) then) =
      _$ExploreStateCopyWithImpl<$Res, ExploreState>;
  @useResult
  $Res call({bool isLoading, List<ExploreModel> blogs});
}

/// @nodoc
class _$ExploreStateCopyWithImpl<$Res, $Val extends ExploreState>
    implements $ExploreStateCopyWith<$Res> {
  _$ExploreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? blogs = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      blogs: null == blogs
          ? _value.blogs
          : blogs // ignore: cast_nullable_to_non_nullable
              as List<ExploreModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExploreStateCopyWith<$Res>
    implements $ExploreStateCopyWith<$Res> {
  factory _$$_ExploreStateCopyWith(
          _$_ExploreState value, $Res Function(_$_ExploreState) then) =
      __$$_ExploreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ExploreModel> blogs});
}

/// @nodoc
class __$$_ExploreStateCopyWithImpl<$Res>
    extends _$ExploreStateCopyWithImpl<$Res, _$_ExploreState>
    implements _$$_ExploreStateCopyWith<$Res> {
  __$$_ExploreStateCopyWithImpl(
      _$_ExploreState _value, $Res Function(_$_ExploreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? blogs = null,
  }) {
    return _then(_$_ExploreState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      blogs: null == blogs
          ? _value._blogs
          : blogs // ignore: cast_nullable_to_non_nullable
              as List<ExploreModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExploreState implements _ExploreState {
  const _$_ExploreState(
      {this.isLoading = false, final List<ExploreModel> blogs = const []})
      : _blogs = blogs;

  factory _$_ExploreState.fromJson(Map<String, dynamic> json) =>
      _$$_ExploreStateFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  final List<ExploreModel> _blogs;
  @override
  @JsonKey()
  List<ExploreModel> get blogs {
    if (_blogs is EqualUnmodifiableListView) return _blogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blogs);
  }

  @override
  String toString() {
    return 'ExploreState(isLoading: $isLoading, blogs: $blogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExploreState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._blogs, _blogs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_blogs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExploreStateCopyWith<_$_ExploreState> get copyWith =>
      __$$_ExploreStateCopyWithImpl<_$_ExploreState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExploreStateToJson(
      this,
    );
  }
}

abstract class _ExploreState implements ExploreState {
  const factory _ExploreState(
      {final bool isLoading, final List<ExploreModel> blogs}) = _$_ExploreState;

  factory _ExploreState.fromJson(Map<String, dynamic> json) =
      _$_ExploreState.fromJson;

  @override
  bool get isLoading;
  @override
  List<ExploreModel> get blogs;
  @override
  @JsonKey(ignore: true)
  _$$_ExploreStateCopyWith<_$_ExploreState> get copyWith =>
      throw _privateConstructorUsedError;
}
