import 'package:shop/domain/entities/banner_data.dart';
import 'package:shop/domain/entities/category_data.dart';
import 'package:shop/domain/entities/data_result.dart';
import 'package:shop/domain/entities/product_data.dart';
import 'package:shop/domain/repositories/home_repository.dart';
import 'package:shop/domain/usecase/home_usecase.dart';

class HomeUsecaseImpl extends HomeUsecase {
  final HomeRepository _homeRepository;
  HomeUsecaseImpl(this._homeRepository);

  @override
  Future<DataResult<List<BannerData>>> getBanner() {
    return _homeRepository.getBanner();
  }

  @override
  Future<DataResult<List<CategoryData>>> getCategory() {
    return _homeRepository.getCategory();
  }

  @override
  Future<DataResult<List<ProductData>>> getProduct() {
    return _homeRepository.getProduct();
  }
}
