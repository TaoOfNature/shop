import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_data.freezed.dart';

@freezed
sealed class BannerData with _$BannerData {
  const factory BannerData({required String shopId, required String imageUrl}) =
      _BannerData;
}
