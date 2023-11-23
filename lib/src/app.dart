import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_vaga_flutter/src/constants/theme.dart';

import 'pages/home/home_controller.dart';
import 'pages/login/login_controller.dart';
import 'pages/login/login_page.dart';
import 'repositories/local/shared_preferences_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginController>(create: (_) => LoginController()),
        Provider<LocalRepositoryWithSharedPreferences>(
            create: (_) => LocalRepositoryWithSharedPreferences()),
        Provider<HomeController>(
          create: (_) => HomeController(LocalRepositoryWithSharedPreferences()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme,
        home: const LoginPage(),
      ),
    );
  }
}
