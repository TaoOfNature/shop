import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/domain/entities/data_result.dart';
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
    emit(LoginLoading());
    final result = await loginUsecase.login(event.username, event.password);
    emit(switch (result) {
      Success(data: final user) => LoginSuccess(user),
      Failure(message: final msg) => LoginFailure(msg),
    });
  }
}
