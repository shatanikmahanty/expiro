import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_alerts_model.freezed.dart';
part 'product_alerts_model.g.dart';

//ignore_for_file: invalid_annotation_target

@freezed
class ProductAlertsModel with _$ProductAlertsModel {
  const factory ProductAlertsModel({
    required String name,
    @JsonKey(includeIfNull: false) String? image,
    required AlertType alertType,
  }) = _ProductAlertsModel;

  factory ProductAlertsModel.fromJson(Map<String, dynamic> json) => _$ProductAlertsModelFromJson(json);
}

enum AlertType {
  expired(value: 'Expired'),
  expiringSoon(value: 'Expiring Soon');

  const AlertType({
    required this.value,
  });

  final String value;
}

extension ProductAlertsModelX on ProductAlertsModel {
  IconData get alertIcon {
    switch (alertType) {
      case AlertType.expired:
        return Icons.error_outline;
      case AlertType.expiringSoon:
        return Icons.warning_amber;
    }
  }

  Color get alertIconColor {
    switch (alertType) {
      case AlertType.expired:
        return Colors.red;
      case AlertType.expiringSoon:
        return Colors.amber;
    }
  }
}
