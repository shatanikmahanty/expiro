import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(
      includeToJson: false,
    )
    required String id,
    required String name,
    required String image,
    required int quantity,
    required String manufactureDate,
    required String expiryDate,
    required String category,
    required String storage,
    required String storageInstructions,
    required String recyclable,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
