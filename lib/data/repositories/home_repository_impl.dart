import 'package:shop/data/datasources/remote/api_service.dart';
import 'package:shop/data/models/banner_model.dart';
import 'package:shop/data/models/category_model.dart';
import 'package:shop/data/models/product_model.dart';
import 'package:shop/data/models/repository_helper.dart';
import 'package:shop/domain/entities/banner_data.dart';
import 'package:shop/domain/entities/category_data.dart';
import 'package:shop/domain/entities/data_result.dart';
import 'package:shop/domain/entities/product_data.dart';
import 'package:shop/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository with RepositoryHelper {
  final ApiService _apiService;

  HomeRepositoryImpl(this._apiService);

  @override
  Future<DataResult<List<BannerData>>> getBanner() async {
    return mapToResult<List<BannerModel>, List<BannerData>>(
      // 1. 调接口
      call: () => _apiService.getBanner(),

      // 2. 转换数据逻辑
      mapToEntity: (list) {
        final entities = list.map((model) => model.toEntity()).toList();
        return entities; // 返回给上层完整的列表
      },
    );
  }

  @override
  Future<DataResult<List<CategoryData>>> getCategory() async {
    return mapToResult<List<CategoryModel>, List<CategoryData>>(
      call: () => _apiService.getCategory(),
      mapToEntity: (list) {
        final entities = list.map((model) => model.toEntity()).toList();
        return entities;
      },
    );
  }

  @override
  Future<DataResult<List<ProductData>>> getProduct() async {
    return mapToResult<List<ProductModel>, List<ProductData>>(
      call: () => _apiService.getProduct(),
      mapToEntity: (list) {
        final entities = list.map((model) => model.toEntity()).toList();
        return entities;
      },
    );
  }
}
