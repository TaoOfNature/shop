import 'package:shop/domain/entities/user_data.dart';
import 'package:shop/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<UserData> login(String phone, String password) async {
    return UserData(token:"", userId: "id", userName: "name",phone: "");
  }
}
