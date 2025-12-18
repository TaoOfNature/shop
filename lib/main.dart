import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:shop/injection_container.dart';
import 'package:shop/presentation/bloc/login/login_bloc.dart';
import 'package:shop/presentation/pages/login.dart';
import 'package:shop/gen/app_localizations.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint(
      '${record.time}: ${record.level.name}: ${record.loggerName}: ${record.message}',
    );
  });
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @Preview()
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => getIt<LoginBloc>(),
        ),
      ],
      child: MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 9, 108, 146),
          ),
        ),
        home: LoginWidget(),
      ),
    );
  }
}
