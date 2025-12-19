import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop/domain/entities/user_data.dart'; // 确保路径正确

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  // 1. 初始状态：页面刚打开
  const factory LoginState.initial() = _Initial;

  // 2. 加载状态：点击登录按钮，正在请求接口
  const factory LoginState.loading() = _Loading;

  // 3. 成功状态：拿到 UserData，准备跳转
  const factory LoginState.success(UserData user) = _Success;

  // 4. 失败状态：捕获到异常，返回错误信息
  const factory LoginState.failure(String message) = _Failure;
}