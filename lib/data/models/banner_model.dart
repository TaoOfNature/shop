import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop/domain/entities/banner.dart';

part 'banner_model.g.dart';
part 'banner_model.freezed.dart';

@Freezed(genericArgumentFactories: true)
sealed class BannerModel with _$BannerModel {
  const factory BannerModel({
    required String shopId,
    required String imageUrl,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

extension BannerModelX on BannerModel {
  Banner toEntity() => Banner(shopId: shopId, imageUrl: imageUrl);
}
