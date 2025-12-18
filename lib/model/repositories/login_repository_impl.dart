import 'package:shop/domain/entities/user.dart';
import 'package:shop/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<User> login(String phone, String password) async {
    return User(id: "id", name: "name");
  }
}
