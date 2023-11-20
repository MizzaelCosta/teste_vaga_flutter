import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_vaga_flutter/src/pages/login/login_controller.dart';

import 'src/app.dart';
import 'src/pages/home/home_controller.dart';
import 'src/repositories/local/shared_preferences_repository.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        Provider<LoginController>(create: (_) => LoginController()),
        Provider<LocalRepositoryWithSharedPreferences>(
            create: (_) => LocalRepositoryWithSharedPreferences()),
        Provider<HomeController>(
          create: (_) => HomeController(LocalRepositoryWithSharedPreferences()),
        ),
      ],
      child: const App(),
    ),
  );
}
