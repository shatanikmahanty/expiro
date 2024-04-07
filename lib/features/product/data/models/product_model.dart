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
    @JsonKey(includeIfNull: false) String? image,
    required int quantity,
    required DateTime manufactureDate,
    required DateTime expiryDate,
    required String? category,
    required String? location,
    @JsonKey(name: 'storage_instructions') required String? storageInstructions,
    required bool? recyclable,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

extension ProductModelX on ProductModel {
  String? get isRecyclableStr => recyclable == null
      ? null
      : recyclable!
          ? 'Recyclable'
          : 'Non Recyclable';
}
