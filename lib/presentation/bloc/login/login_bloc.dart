import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/domain/entities/data_result.dart';
import 'package:shop/domain/usecase/login_usecase.dart';
import 'package:shop/presentation/bloc/login/login_event.dart';
import 'package:shop/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  // ✅ 1. 初始状态改为 LoginState.initial()
  LoginBloc(this.loginUsecase) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      // ✅ 使用 map 处理所有可能的事件
      await event.map(
        // 1. 处理登录点击
        loginPressed: (e) async {
          emit(const LoginState.loading());
          final result = await loginUsecase.login(e.username, e.password);
          emit(switch (result) {
            Success(data: final user) => LoginState.success(user),
            Failure(message: final msg) => LoginState.failure(msg),
          });
        },

        // 2. 假设以后添加：点击了发送验证码
        // sendCodePressed: (e) async {
        //   // 处理发送验证码逻辑...
        // },

        // 3. 假设以后添加：点击了登出
        // logoutRequested: (e) async {
        //   emit(const LoginState.initial());
        // },
      );
    });
  }
}
