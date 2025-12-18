import 'package:shop/domain/entities/user.dart';

abstract class LoginRepository {
  Future<User> login(String phone, String password);
}
