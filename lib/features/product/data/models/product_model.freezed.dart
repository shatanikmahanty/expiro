// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @JsonKey(includeToJson: false)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get image => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  DateTime get manufactureDate => throw _privateConstructorUsedError;
  DateTime get expiryDate => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage_instructions')
  String? get storageInstructions => throw _privateConstructorUsedError;
  bool? get recyclable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      String name,
      @JsonKey(includeIfNull: false) String? image,
      int quantity,
      DateTime manufactureDate,
      DateTime expiryDate,
      String? category,
      String? location,
      @JsonKey(name: 'storage_instructions') String? storageInstructions,
      bool? recyclable});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
    Object? quantity = null,
    Object? manufactureDate = null,
    Object? expiryDate = null,
    Object? category = freezed,
    Object? location = freezed,
    Object? storageInstructions = freezed,
    Object? recyclable = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      manufactureDate: null == manufactureDate
          ? _value.manufactureDate
          : manufactureDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      storageInstructions: freezed == storageInstructions
          ? _value.storageInstructions
          : storageInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      recyclable: freezed == recyclable
          ? _value.recyclable
          : recyclable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      String name,
      @JsonKey(includeIfNull: false) String? image,
      int quantity,
      DateTime manufactureDate,
      DateTime expiryDate,
      String? category,
      String? location,
      @JsonKey(name: 'storage_instructions') String? storageInstructions,
      bool? recyclable});
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductModel>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
    Object? quantity = null,
    Object? manufactureDate = null,
    Object? expiryDate = null,
    Object? category = freezed,
    Object? location = freezed,
    Object? storageInstructions = freezed,
    Object? recyclable = freezed,
  }) {
    return _then(_$_ProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      manufactureDate: null == manufactureDate
          ? _value.manufactureDate
          : manufactureDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      storageInstructions: freezed == storageInstructions
          ? _value.storageInstructions
          : storageInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      recyclable: freezed == recyclable
          ? _value.recyclable
          : recyclable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel implements _ProductModel {
  const _$_ProductModel(
      {@JsonKey(includeToJson: false) required this.id,
      required this.name,
      @JsonKey(includeIfNull: false) this.image,
      required this.quantity,
      required this.manufactureDate,
      required this.expiryDate,
      required this.category,
      required this.location,
      @JsonKey(name: 'storage_instructions') required this.storageInstructions,
      required this.recyclable});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String id;
  @override
  final String name;
  @override
  @JsonKey(includeIfNull: false)
  final String? image;
  @override
  final int quantity;
  @override
  final DateTime manufactureDate;
  @override
  final DateTime expiryDate;
  @override
  final String? category;
  @override
  final String? location;
  @override
  @JsonKey(name: 'storage_instructions')
  final String? storageInstructions;
  @override
  final bool? recyclable;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, image: $image, quantity: $quantity, manufactureDate: $manufactureDate, expiryDate: $expiryDate, category: $category, location: $location, storageInstructions: $storageInstructions, recyclable: $recyclable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.manufactureDate, manufactureDate) ||
                other.manufactureDate == manufactureDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.storageInstructions, storageInstructions) ||
                other.storageInstructions == storageInstructions) &&
            (identical(other.recyclable, recyclable) ||
                other.recyclable == recyclable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      image,
      quantity,
      manufactureDate,
      expiryDate,
      category,
      location,
      storageInstructions,
      recyclable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {@JsonKey(includeToJson: false) required final String id,
      required final String name,
      @JsonKey(includeIfNull: false) final String? image,
      required final int quantity,
      required final DateTime manufactureDate,
      required final DateTime expiryDate,
      required final String? category,
      required final String? location,
      @JsonKey(name: 'storage_instructions')
      required final String? storageInstructions,
      required final bool? recyclable}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String get id;
  @override
  String get name;
  @override
  @JsonKey(includeIfNull: false)
  String? get image;
  @override
  int get quantity;
  @override
  DateTime get manufactureDate;
  @override
  DateTime get expiryDate;
  @override
  String? get category;
  @override
  String? get location;
  @override
  @JsonKey(name: 'storage_instructions')
  String? get storageInstructions;
  @override
  bool? get recyclable;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
