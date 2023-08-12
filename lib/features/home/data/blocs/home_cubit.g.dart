// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeState _$$_HomeStateFromJson(Map<String, dynamic> json) => _$_HomeState(
      aqi: json['aqi'] as int,
      location: json['location'] as String,
      diseases: (json['diseases'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      advisory: json['advisory'] as String?,
    );

Map<String, dynamic> _$$_HomeStateToJson(_$_HomeState instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'location': instance.location,
      'diseases': instance.diseases,
      'advisory': instance.advisory,
    };
