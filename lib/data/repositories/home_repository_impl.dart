import 'package:shop/data/datasources/remote/api_service.dart';
import 'package:shop/data/models/banner_model.dart';
import 'package:shop/data/models/repository_helper.dart';
import 'package:shop/domain/entities/banner.dart';
import 'package:shop/domain/entities/data_result.dart';
import 'package:shop/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository with RepositoryHelper {
  final ApiService _apiService;

  HomeRepositoryImpl(this._apiService);

  @override
  Future<DataResult<List<Banner>>> getBanner() async {
    return mapToResult<List<BannerModel>, List<Banner>>(
      // 1. 调接口
      call: () => _apiService.getBanner(),

      // 2. 转换数据逻辑
      mapToEntity: (list) {
        final entities = list.map((model) => model.toEntity()).toList();
        return entities; // 返回给上层完整的列表
      },
    );
  }
}
