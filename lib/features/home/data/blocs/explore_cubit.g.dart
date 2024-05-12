// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExploreState _$$_ExploreStateFromJson(Map<String, dynamic> json) =>
    _$_ExploreState(
      isLoading: json['isLoading'] as bool? ?? false,
      blogs: (json['blogs'] as List<dynamic>?)
              ?.map((e) => ExploreModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ExploreStateToJson(_$_ExploreState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'blogs': instance.blogs,
    };
