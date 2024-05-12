// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_alerts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductAlertsModel _$$_ProductAlertsModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProductAlertsModel(
      name: json['name'] as String,
      image: json['image'] as String?,
      alertType: $enumDecode(_$AlertTypeEnumMap, json['alertType']),
    );

Map<String, dynamic> _$$_ProductAlertsModelToJson(
    _$_ProductAlertsModel instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('image', instance.image);
  val['alertType'] = _$AlertTypeEnumMap[instance.alertType]!;
  return val;
}

const _$AlertTypeEnumMap = {
  AlertType.expired: 'expired',
  AlertType.expiringSoon: 'expiringSoon',
};
