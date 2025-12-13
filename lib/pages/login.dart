import 'package:flutter/material.dart';
import 'package:shop/gen/app_localizations.dart';
import 'package:shop/pages/widgets.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login")),
      body: Column(
        children: [
          InputWidget(labelText: AppLocalizations.of(context)!.labelTextPhone),
          // SizedBox(height: 20.0),
          InputWidget(
            labelText: AppLocalizations.of(context)!.labelTextPassword,
          ),
        ],
      ),
    );
  }

  // Login widget implementation
}
