import 'package:shop/data/datasources/remote/api_service.dart';
import 'package:shop/data/models/repository_helper.dart';
import 'package:shop/data/models/user_model.dart';
import 'package:shop/domain/entities/data_result.dart';
import 'package:shop/domain/entities/user_data.dart';
import 'package:shop/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository with RepositoryHelper {
  final ApiService _apiService;

  LoginRepositoryImpl(this._apiService);

  @override
  Future<DataResult<UserData>> login(String phone, String password) async {
    return mapToResult<UserModel, UserData>(
      // 1. 调接口
      call: () => _apiService.login(phone, password),

      // 2. 转换数据逻辑
      mapToEntity: (models) {
        final entities = models.toEntity();
        return entities; // 返回给上层完整的列表
      },
    );
  }
}
