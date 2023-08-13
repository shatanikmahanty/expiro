// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      quantity: json['quantity'] as int,
      manufactureDate: json['manufactureDate'] as String,
      expiryDate: json['expiryDate'] as String,
      category: json['category'] as String,
      storage: json['storage'] as String,
      storageInstructions: json['storageInstructions'] as String,
      recyclable: json['recyclable'] as String,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'quantity': instance.quantity,
      'manufactureDate': instance.manufactureDate,
      'expiryDate': instance.expiryDate,
      'category': instance.category,
      'storage': instance.storage,
      'storageInstructions': instance.storageInstructions,
      'recyclable': instance.recyclable,
    };
