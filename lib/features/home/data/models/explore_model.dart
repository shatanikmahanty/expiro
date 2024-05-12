import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_model.freezed.dart';
part 'explore_model.g.dart';

@freezed
class ExploreModel with _$ExploreModel {
  const factory ExploreModel({
    required String title,
    required String subtitle,
    required String launchUrl,
    required String image,
  }) = _ExploreModel;

  factory ExploreModel.fromJson(Map<String, dynamic> json) =>
      _$ExploreModelFromJson(json);
}
