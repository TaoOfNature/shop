import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';

@Freezed()
sealed class UserData with _$UserData {
  const factory UserData({
    required String token,
    required String userId,
    required String userName,
    required String phone,
  }) = _UserData;
}
