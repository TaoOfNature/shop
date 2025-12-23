import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner.freezed.dart';

@freezed
sealed class Banner with _$Banner {
  const factory Banner({
    required String shopId,
    required String imageUrl
  }) = _Banner;
}
