import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop/domain/entities/user_data.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@Freezed(genericArgumentFactories: true)
sealed class UserModel with _$UserModel {
  const factory UserModel({
    required String token,
    required String userId,
    required String userName,
    required String phone,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  UserData toEntity() =>
      UserData(token: token, userName: userName, userId: userId, phone: phone);
}
