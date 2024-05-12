// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExploreModel _$ExploreModelFromJson(Map<String, dynamic> json) {
  return _ExploreModel.fromJson(json);
}

/// @nodoc
mixin _$ExploreModel {
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get launchUrl => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExploreModelCopyWith<ExploreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreModelCopyWith<$Res> {
  factory $ExploreModelCopyWith(
          ExploreModel value, $Res Function(ExploreModel) then) =
      _$ExploreModelCopyWithImpl<$Res, ExploreModel>;
  @useResult
  $Res call({String title, String subtitle, String launchUrl, String image});
}

/// @nodoc
class _$ExploreModelCopyWithImpl<$Res, $Val extends ExploreModel>
    implements $ExploreModelCopyWith<$Res> {
  _$ExploreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? launchUrl = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      launchUrl: null == launchUrl
          ? _value.launchUrl
          : launchUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExploreModelCopyWith<$Res>
    implements $ExploreModelCopyWith<$Res> {
  factory _$$_ExploreModelCopyWith(
          _$_ExploreModel value, $Res Function(_$_ExploreModel) then) =
      __$$_ExploreModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String subtitle, String launchUrl, String image});
}

/// @nodoc
class __$$_ExploreModelCopyWithImpl<$Res>
    extends _$ExploreModelCopyWithImpl<$Res, _$_ExploreModel>
    implements _$$_ExploreModelCopyWith<$Res> {
  __$$_ExploreModelCopyWithImpl(
      _$_ExploreModel _value, $Res Function(_$_ExploreModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? launchUrl = null,
    Object? image = null,
  }) {
    return _then(_$_ExploreModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      launchUrl: null == launchUrl
          ? _value.launchUrl
          : launchUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExploreModel implements _ExploreModel {
  const _$_ExploreModel(
      {required this.title,
      required this.subtitle,
      required this.launchUrl,
      required this.image});

  factory _$_ExploreModel.fromJson(Map<String, dynamic> json) =>
      _$$_ExploreModelFromJson(json);

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String launchUrl;
  @override
  final String image;

  @override
  String toString() {
    return 'ExploreModel(title: $title, subtitle: $subtitle, launchUrl: $launchUrl, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExploreModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.launchUrl, launchUrl) ||
                other.launchUrl == launchUrl) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, subtitle, launchUrl, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExploreModelCopyWith<_$_ExploreModel> get copyWith =>
      __$$_ExploreModelCopyWithImpl<_$_ExploreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExploreModelToJson(
      this,
    );
  }
}

abstract class _ExploreModel implements ExploreModel {
  const factory _ExploreModel(
      {required final String title,
      required final String subtitle,
      required final String launchUrl,
      required final String image}) = _$_ExploreModel;

  factory _ExploreModel.fromJson(Map<String, dynamic> json) =
      _$_ExploreModel.fromJson;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get launchUrl;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_ExploreModelCopyWith<_$_ExploreModel> get copyWith =>
      throw _privateConstructorUsedError;
}
