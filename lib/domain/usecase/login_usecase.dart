import 'package:shop/domain/entities/user.dart';
import 'package:shop/domain/repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepository _repository;
  const LoginUsecase(this._repository);

  Future<User>? login(String phone, String password) {
    return _repository.login(phone, password);
  }
}
