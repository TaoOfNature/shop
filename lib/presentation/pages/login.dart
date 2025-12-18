import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:shop/gen/app_localizations.dart';
import 'package:shop/presentation/bloc/login/login_bloc.dart';
import 'package:shop/presentation/bloc/login/login_event.dart';
import 'package:shop/presentation/bloc/login/login_state.dart';
import 'package:shop/presentation/widgets/forms/forms.dart';

var _log = Logger("login");

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login")),
      body: BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _phoneWidget(context),
              _passwordWidget(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      var phone = _phoneController.text;
                      var password = _passworkController.text;
                      final event = LoginButtonPressed(phone, password);
                      // 这一行是 UI 和 Bloc 连接的唯一入口
                      context.read<LoginBloc>().add(event);
                      _log.info(
                        "login ${_phoneController.text},${_passworkController.text}",
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: styleInput,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      _log.info("register");
                    },
                    child: Text(AppLocalizations.of(context)!.register),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      _log.info("forgot password");
                    },
                    child: Text(AppLocalizations.of(context)!.forgetPassword),
                  ),
                ],
              ),
            ],
          );
        },
        listener: (BuildContext context, LoginState state) {
          if (state is LoginSuccess) {
            // 登录成功，显示提示
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("登录成功！")));
          } else if (state is LoginFailure) {
            // 登录失败，显示错误原因
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
      ),
    );
  }
}

@Preview(name: "login")
Widget getLoginWidget() {
  return LoginWidget();
}

var styleInput = TextStyle(color: Colors.black, fontSize: 20);
TextEditingController _phoneController = TextEditingController();
TextEditingController _passworkController = TextEditingController();

Widget _phoneWidget(BuildContext context) {
  return InputWidget(
    controller: _phoneController,
    labelText: AppLocalizations.of(context)!.labelTextPhone,
    inputType: TextInputType.phone,
    maxLength: 11,
    config: InputConfig(textStyle: styleInput),
  );
}

Widget _passwordWidget(BuildContext context) {
  return InputWidget(
    controller: _passworkController,
    labelText: AppLocalizations.of(context)!.labelTextPassword,
    inputType: TextInputType.visiblePassword,
    maxLength: 32,
    config: InputConfig(textStyle: styleInput),
  );
}
