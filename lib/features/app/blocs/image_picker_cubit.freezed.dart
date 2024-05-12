// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_picker_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImagePickerState _$ImagePickerStateFromJson(Map<String, dynamic> json) {
  return _ImagePickerState.fromJson(json);
}

/// @nodoc
mixin _$ImagePickerState {
  String? get pickedImagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagePickerStateCopyWith<ImagePickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagePickerStateCopyWith<$Res> {
  factory $ImagePickerStateCopyWith(
          ImagePickerState value, $Res Function(ImagePickerState) then) =
      _$ImagePickerStateCopyWithImpl<$Res, ImagePickerState>;
  @useResult
  $Res call({String? pickedImagePath});
}

/// @nodoc
class _$ImagePickerStateCopyWithImpl<$Res, $Val extends ImagePickerState>
    implements $ImagePickerStateCopyWith<$Res> {
  _$ImagePickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedImagePath = freezed,
  }) {
    return _then(_value.copyWith(
      pickedImagePath: freezed == pickedImagePath
          ? _value.pickedImagePath
          : pickedImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImagePickerStateCopyWith<$Res>
    implements $ImagePickerStateCopyWith<$Res> {
  factory _$$_ImagePickerStateCopyWith(
          _$_ImagePickerState value, $Res Function(_$_ImagePickerState) then) =
      __$$_ImagePickerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? pickedImagePath});
}

/// @nodoc
class __$$_ImagePickerStateCopyWithImpl<$Res>
    extends _$ImagePickerStateCopyWithImpl<$Res, _$_ImagePickerState>
    implements _$$_ImagePickerStateCopyWith<$Res> {
  __$$_ImagePickerStateCopyWithImpl(
      _$_ImagePickerState _value, $Res Function(_$_ImagePickerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedImagePath = freezed,
  }) {
    return _then(_$_ImagePickerState(
      pickedImagePath: freezed == pickedImagePath
          ? _value.pickedImagePath
          : pickedImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImagePickerState implements _ImagePickerState {
  const _$_ImagePickerState({this.pickedImagePath});

  factory _$_ImagePickerState.fromJson(Map<String, dynamic> json) =>
      _$$_ImagePickerStateFromJson(json);

  @override
  final String? pickedImagePath;

  @override
  String toString() {
    return 'ImagePickerState(pickedImagePath: $pickedImagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagePickerState &&
            (identical(other.pickedImagePath, pickedImagePath) ||
                other.pickedImagePath == pickedImagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pickedImagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagePickerStateCopyWith<_$_ImagePickerState> get copyWith =>
      __$$_ImagePickerStateCopyWithImpl<_$_ImagePickerState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImagePickerStateToJson(
      this,
    );
  }
}

abstract class _ImagePickerState implements ImagePickerState {
  const factory _ImagePickerState({final String? pickedImagePath}) =
      _$_ImagePickerState;

  factory _ImagePickerState.fromJson(Map<String, dynamic> json) =
      _$_ImagePickerState.fromJson;

  @override
  String? get pickedImagePath;
  @override
  @JsonKey(ignore: true)
  _$$_ImagePickerStateCopyWith<_$_ImagePickerState> get copyWith =>
      throw _privateConstructorUsedError;
}
