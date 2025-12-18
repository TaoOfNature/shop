import 'package:shop/domain/entities/user.dart';

abstract class LoginUsecase {
  Future<User> login(String phone, String password);
}
