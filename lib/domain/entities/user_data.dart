import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.g.dart';
part 'user_data.freezed.dart';

@Freezed(genericArgumentFactories: true)
sealed class UserData with _$UserData {
  const factory UserData({
    required String token,
    required String userId,
    required String userName,
    required String phone,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

}
