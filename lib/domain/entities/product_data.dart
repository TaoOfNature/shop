import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_data.freezed.dart';

@freezed
sealed class ProductData with _$ProductData {
  const factory ProductData({
    required String id,
    required String name,
    required String imageUrl,
    required double price,
    required double originalPrice,
    required int sales,
  }) = _ProductData;

}
