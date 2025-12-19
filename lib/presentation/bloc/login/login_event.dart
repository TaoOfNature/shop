import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  // 把具体的事件定义为不同的 factory
  const factory LoginEvent.loginPressed({
    required String username,
    required String password,
  }) = _LoginPressed;

  // 以后增加新事件（比如“切换验证码”）会非常快
  // const factory LoginEvent.togglePasswordVisible() = _TogglePasswordVisible;
}
