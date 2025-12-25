import 'package:shop/domain/entities/banner_data.dart';
import 'package:shop/domain/entities/data_result.dart';
import 'package:shop/domain/repositories/home_repository.dart';
import 'package:shop/domain/usecase/home_usecase.dart';

class HomeUsecaseImpl extends HomeUsecase {
  final HomeRepository _homeRepository;
  HomeUsecaseImpl(this._homeRepository);

  @override
  Future<DataResult<List<BannerData>>> getBanner() {
    return _homeRepository.getBanner();
  }
}
