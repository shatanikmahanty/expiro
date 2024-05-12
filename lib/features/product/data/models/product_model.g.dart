// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      quantity: json['quantity'] as int,
      manufactureDate: DateTime.parse(json['manufactureDate'] as String),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      category: json['category'] as String?,
      location: json['location'] as String?,
      storageInstructions: json['storage_instructions'] as String?,
      recyclable: json['recyclable'] as bool?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('image', instance.image);
  val['quantity'] = instance.quantity;
  val['manufactureDate'] = instance.manufactureDate.toIso8601String();
  val['expiryDate'] = instance.expiryDate.toIso8601String();
  val['category'] = instance.category;
  val['location'] = instance.location;
  val['storage_instructions'] = instance.storageInstructions;
  val['recyclable'] = instance.recyclable;
  return val;
}
