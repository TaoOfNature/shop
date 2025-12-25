import 'package:shop/domain/entities/banner_data.dart';
import 'package:shop/domain/entities/data_result.dart';

abstract class HomeUsecase {
  Future<DataResult<List<BannerData>>> getBanner();
}
