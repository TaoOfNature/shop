import 'package:shop/domain/entities/user.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;
  const LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final String message;
  const LoginFailure(this.message);
}
