import 'package:flutter/material.dart';
import 'package:teste_vaga_flutter/src/constants/theme.dart';

import 'pages/login/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const LoginPage(),
    );
  }
}
