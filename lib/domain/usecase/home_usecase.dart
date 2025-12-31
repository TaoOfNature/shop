import 'package:shop/domain/entities/banner_data.dart';
import 'package:shop/domain/entities/category_data.dart';
import 'package:shop/domain/entities/data_result.dart';
import 'package:shop/domain/entities/product_data.dart';

abstract class HomeUsecase {
  Future<DataResult<List<BannerData>>> getBanner();
  Future<DataResult<List<CategoryData>>> getCategory();
  Future<DataResult<List<ProductData>>> getProduct();
}
