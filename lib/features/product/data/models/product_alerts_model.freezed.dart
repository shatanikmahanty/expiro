// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_alerts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductAlertsModel _$ProductAlertsModelFromJson(Map<String, dynamic> json) {
  return _ProductAlertsModel.fromJson(json);
}

/// @nodoc
mixin _$ProductAlertsModel {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get image => throw _privateConstructorUsedError;
  AlertType get alertType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductAlertsModelCopyWith<ProductAlertsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductAlertsModelCopyWith<$Res> {
  factory $ProductAlertsModelCopyWith(
          ProductAlertsModel value, $Res Function(ProductAlertsModel) then) =
      _$ProductAlertsModelCopyWithImpl<$Res, ProductAlertsModel>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) String? image,
      AlertType alertType});
}

/// @nodoc
class _$ProductAlertsModelCopyWithImpl<$Res, $Val extends ProductAlertsModel>
    implements $ProductAlertsModelCopyWith<$Res> {
  _$ProductAlertsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = freezed,
    Object? alertType = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      alertType: null == alertType
          ? _value.alertType
          : alertType // ignore: cast_nullable_to_non_nullable
              as AlertType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductAlertsModelCopyWith<$Res>
    implements $ProductAlertsModelCopyWith<$Res> {
  factory _$$_ProductAlertsModelCopyWith(_$_ProductAlertsModel value,
          $Res Function(_$_ProductAlertsModel) then) =
      __$$_ProductAlertsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) String? image,
      AlertType alertType});
}

/// @nodoc
class __$$_ProductAlertsModelCopyWithImpl<$Res>
    extends _$ProductAlertsModelCopyWithImpl<$Res, _$_ProductAlertsModel>
    implements _$$_ProductAlertsModelCopyWith<$Res> {
  __$$_ProductAlertsModelCopyWithImpl(
      _$_ProductAlertsModel _value, $Res Function(_$_ProductAlertsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = freezed,
    Object? alertType = null,
  }) {
    return _then(_$_ProductAlertsModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      alertType: null == alertType
          ? _value.alertType
          : alertType // ignore: cast_nullable_to_non_nullable
              as AlertType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductAlertsModel implements _ProductAlertsModel {
  const _$_ProductAlertsModel(
      {required this.name,
      @JsonKey(includeIfNull: false) this.image,
      required this.alertType});

  factory _$_ProductAlertsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductAlertsModelFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(includeIfNull: false)
  final String? image;
  @override
  final AlertType alertType;

  @override
  String toString() {
    return 'ProductAlertsModel(name: $name, image: $image, alertType: $alertType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductAlertsModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.alertType, alertType) ||
                other.alertType == alertType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, image, alertType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductAlertsModelCopyWith<_$_ProductAlertsModel> get copyWith =>
      __$$_ProductAlertsModelCopyWithImpl<_$_ProductAlertsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductAlertsModelToJson(
      this,
    );
  }
}

abstract class _ProductAlertsModel implements ProductAlertsModel {
  const factory _ProductAlertsModel(
      {required final String name,
      @JsonKey(includeIfNull: false) final String? image,
      required final AlertType alertType}) = _$_ProductAlertsModel;

  factory _ProductAlertsModel.fromJson(Map<String, dynamic> json) =
      _$_ProductAlertsModel.fromJson;

  @override
  String get name;
  @override
  @JsonKey(includeIfNull: false)
  String? get image;
  @override
  AlertType get alertType;
  @override
  @JsonKey(ignore: true)
  _$$_ProductAlertsModelCopyWith<_$_ProductAlertsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
