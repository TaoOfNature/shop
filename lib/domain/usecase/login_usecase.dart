import 'package:shop/domain/entities/user_data.dart';

abstract class LoginUsecase {
  Future<UserData> login(String phone, String password);
}
