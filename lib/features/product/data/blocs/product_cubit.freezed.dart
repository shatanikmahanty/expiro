// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductState _$ProductStateFromJson(Map<String, dynamic> json) {
  return _ProductState.fromJson(json);
}

/// @nodoc
mixin _$ProductState {
  List<ProductModel> get products => throw _privateConstructorUsedError;
  List<ProductAlertsModel> get productAlerts =>
      throw _privateConstructorUsedError;
  List<ProductModel> get filteredProducts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get selectedCategory => throw _privateConstructorUsedError;
  int? get expiresInFilter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
  @useResult
  $Res call(
      {List<ProductModel> products,
      List<ProductAlertsModel> productAlerts,
      List<ProductModel> filteredProducts,
      bool isLoading,
      String? selectedCategory,
      int? expiresInFilter});
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? productAlerts = null,
    Object? filteredProducts = null,
    Object? isLoading = null,
    Object? selectedCategory = freezed,
    Object? expiresInFilter = freezed,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      productAlerts: null == productAlerts
          ? _value.productAlerts
          : productAlerts // ignore: cast_nullable_to_non_nullable
              as List<ProductAlertsModel>,
      filteredProducts: null == filteredProducts
          ? _value.filteredProducts
          : filteredProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresInFilter: freezed == expiresInFilter
          ? _value.expiresInFilter
          : expiresInFilter // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductStateCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$$_ProductStateCopyWith(
          _$_ProductState value, $Res Function(_$_ProductState) then) =
      __$$_ProductStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductModel> products,
      List<ProductAlertsModel> productAlerts,
      List<ProductModel> filteredProducts,
      bool isLoading,
      String? selectedCategory,
      int? expiresInFilter});
}

/// @nodoc
class __$$_ProductStateCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductState>
    implements _$$_ProductStateCopyWith<$Res> {
  __$$_ProductStateCopyWithImpl(
      _$_ProductState _value, $Res Function(_$_ProductState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? productAlerts = null,
    Object? filteredProducts = null,
    Object? isLoading = null,
    Object? selectedCategory = freezed,
    Object? expiresInFilter = freezed,
  }) {
    return _then(_$_ProductState(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      productAlerts: null == productAlerts
          ? _value._productAlerts
          : productAlerts // ignore: cast_nullable_to_non_nullable
              as List<ProductAlertsModel>,
      filteredProducts: null == filteredProducts
          ? _value._filteredProducts
          : filteredProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresInFilter: freezed == expiresInFilter
          ? _value.expiresInFilter
          : expiresInFilter // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductState implements _ProductState {
  const _$_ProductState(
      {final List<ProductModel> products = const [],
      final List<ProductAlertsModel> productAlerts = const [],
      final List<ProductModel> filteredProducts = const [],
      this.isLoading = false,
      this.selectedCategory = null,
      this.expiresInFilter = null})
      : _products = products,
        _productAlerts = productAlerts,
        _filteredProducts = filteredProducts;

  factory _$_ProductState.fromJson(Map<String, dynamic> json) =>
      _$$_ProductStateFromJson(json);

  final List<ProductModel> _products;
  @override
  @JsonKey()
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<ProductAlertsModel> _productAlerts;
  @override
  @JsonKey()
  List<ProductAlertsModel> get productAlerts {
    if (_productAlerts is EqualUnmodifiableListView) return _productAlerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productAlerts);
  }

  final List<ProductModel> _filteredProducts;
  @override
  @JsonKey()
  List<ProductModel> get filteredProducts {
    if (_filteredProducts is EqualUnmodifiableListView)
      return _filteredProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredProducts);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? selectedCategory;
  @override
  @JsonKey()
  final int? expiresInFilter;

  @override
  String toString() {
    return 'ProductState(products: $products, productAlerts: $productAlerts, filteredProducts: $filteredProducts, isLoading: $isLoading, selectedCategory: $selectedCategory, expiresInFilter: $expiresInFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductState &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._productAlerts, _productAlerts) &&
            const DeepCollectionEquality()
                .equals(other._filteredProducts, _filteredProducts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.expiresInFilter, expiresInFilter) ||
                other.expiresInFilter == expiresInFilter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_productAlerts),
      const DeepCollectionEquality().hash(_filteredProducts),
      isLoading,
      selectedCategory,
      expiresInFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductStateCopyWith<_$_ProductState> get copyWith =>
      __$$_ProductStateCopyWithImpl<_$_ProductState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductStateToJson(
      this,
    );
  }
}

abstract class _ProductState implements ProductState {
  const factory _ProductState(
      {final List<ProductModel> products,
      final List<ProductAlertsModel> productAlerts,
      final List<ProductModel> filteredProducts,
      final bool isLoading,
      final String? selectedCategory,
      final int? expiresInFilter}) = _$_ProductState;

  factory _ProductState.fromJson(Map<String, dynamic> json) =
      _$_ProductState.fromJson;

  @override
  List<ProductModel> get products;
  @override
  List<ProductAlertsModel> get productAlerts;
  @override
  List<ProductModel> get filteredProducts;
  @override
  bool get isLoading;
  @override
  String? get selectedCategory;
  @override
  int? get expiresInFilter;
  @override
  @JsonKey(ignore: true)
  _$$_ProductStateCopyWith<_$_ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}
