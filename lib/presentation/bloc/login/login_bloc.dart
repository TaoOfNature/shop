import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/domain/usecase/login_usecase.dart';
import 'package:shop/presentation/bloc/login/login_event.dart';
import 'package:shop/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc(this.loginUsecase) : super(LoginInitial()) {
    // 3. 注册事件处理器
    // 我们明确定义处理函数：handler (event, emit)
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    // --- 第一步：通知 UI 层，现在开始加载了 ---
    emit(LoginLoading());

    try {
      // --- 第二步：调用业务层，等待结果 ---
      // event.username 和 event.password 是从 UI 传进来的
      final user = await loginUsecase.login(event.username, event.password);
      // user?.
      // --- 第三步：如果上面那行没报错，说明成功了 ---
      emit(LoginSuccess(user!));
    } catch (e) {
      // --- 第四步：如果 try 块报错了，捕获异常，发出失败状态 ---
      emit(LoginFailure(e.toString()));
    }
  }

}
