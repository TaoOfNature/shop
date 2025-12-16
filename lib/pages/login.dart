import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:logging/logging.dart';
import 'package:shop/gen/app_localizations.dart';
import 'package:shop/widgets/forms/forms.dart';

var _log = Logger("login");

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login")),
      body: Column(
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
      ),
    );
  }

  // Login widget implementation
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
