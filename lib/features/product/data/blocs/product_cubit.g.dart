// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductState _$$_ProductStateFromJson(Map<String, dynamic> json) =>
    _$_ProductState(
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      productAlerts: (json['productAlerts'] as List<dynamic>?)
              ?.map(
                  (e) => ProductAlertsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      filteredProducts: (json['filteredProducts'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
      selectedCategory: json['selectedCategory'] as String? ?? null,
      expiresInFilter: json['expiresInFilter'] as int? ?? null,
    );

Map<String, dynamic> _$$_ProductStateToJson(_$_ProductState instance) =>
    <String, dynamic>{
      'products': instance.products,
      'productAlerts': instance.productAlerts,
      'filteredProducts': instance.filteredProducts,
      'isLoading': instance.isLoading,
      'selectedCategory': instance.selectedCategory,
      'expiresInFilter': instance.expiresInFilter,
    };
