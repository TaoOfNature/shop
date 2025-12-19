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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("login")),
      body: BlocConsumer<LoginBloc, LoginState>(
        // 1. 使用 Freezed 的 when 替代之前的 if (state is ...)
        builder: (context, state) {
          return state.when(
            initial: () => _buildLoginForm(context),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (user) => const Center(
              child: Icon(Icons.check_circle, size: 100, color: Colors.green),
            ),
            failure: (message) => _buildLoginForm(context),
          );
        },
        // 2. 使用 Freezed 的 maybeWhen 处理一次性监听逻辑
        listener: (BuildContext context, LoginState state) {
          state.maybeWhen(
            success: (user) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("登录成功！")));
            },
            failure: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            orElse: () {},
          );
        },
      ),
    );
  }

  // 你的 UI 布局代码原封不动
  Widget _buildLoginForm(BuildContext context) {
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
                var password = _passwordController.text;
                // 触发 Bloc 事件
                context.read<LoginBloc>().add(
                  LoginEvent.loginPressed(username: phone, password: password),
                );
                _log.info("login $phone,$password");
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              child: Text(
                AppLocalizations.of(context)!.login,
                style: _styleInput,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            TextButton(
              onPressed: () => _log.info("register"),
              child: Text(AppLocalizations.of(context)!.register),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => _log.info("forgot password"),
              child: Text(AppLocalizations.of(context)!.forgetPassword),
            ),
          ],
        ),
      ],
    );
  }

  final _styleInput = const TextStyle(color: Colors.black, fontSize: 20);

  Widget _phoneWidget(BuildContext context) {
    return InputWidget(
      controller: _phoneController,
      labelText: AppLocalizations.of(context)!.labelTextPhone,
      inputType: TextInputType.phone,
      maxLength: 11,
      config: InputConfig(textStyle: _styleInput),
    );
  }

  Widget _passwordWidget(BuildContext context) {
    return InputWidget(
      controller: _passwordController,
      labelText: AppLocalizations.of(context)!.labelTextPassword,
      inputType: TextInputType.visiblePassword,
      maxLength: 32,
      config: InputConfig(textStyle: _styleInput),
    );
  }
}

@Preview(name: "login")
Widget getLoginWidget() {
  return LoginPage();
}
