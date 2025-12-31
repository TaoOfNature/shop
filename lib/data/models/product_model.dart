import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop/domain/entities/product_data.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required String imageUrl,
    required double price,
    required double originalPrice,
    required int sales,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

extension ProductModelX on ProductModel {
  ProductData toEntity() => ProductData(
    id: id,
    name: name,
    imageUrl: imageUrl,
    price: price,
    originalPrice: originalPrice,
    sales: sales,
  );
}
