import 'package:shop/domain/entities/user_data.dart';

abstract class LoginRepository {
  Future<UserData> login(String phone, String password);
}
