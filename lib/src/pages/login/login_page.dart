import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../constants/text.dart';
import '../../utils/text_formatter.dart';
import '../../widgets/app_button.dart';
import '../../widgets/gradient_background_color.dart';
import '../../widgets/input_text.dart';
import '../../widgets/show_message.dart';
import '../home/home_page.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  late final LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<LoginController>();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.width * 0.1;

    return Scaffold(
      body: GradientBackgroundColor(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                InputText(
                  key: const Key('user_key'),
                  label: 'Usuário',
                  controller: userController,
                  //TODO: trocar icone
                  prefixIcon: const Icon(Icons.account_box),
                  textInputAction: TextInputAction.next,
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required(userEmptyMessage),
                      Validatorless.max(20, maxCharMessage),
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                InputText(
                  key: const Key('password_key'),
                  label: 'Senha',
                  controller: passwordController,
                  prefixIcon: const Icon(Icons.lock_rounded),
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required(passwordEmptyMessage),
                      Validatorless.max(20, maxCharMessage),
                      Validatorless.min(2, passwordMinCharMessage),
                    ],
                  ),
                  inputFormatters: const [TextFormatter()],
                ),
                const SizedBox(height: 36.0),
                AppButton(
                  key: const Key('login_button_key'),
                  label: 'Entrar',
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      final error = controller.login(
                        user: userController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      if (error == null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomePage(),
                          ),
                        );
                      } else {
                        Message.showSnackBarAlert(
                          context: context,
                          message: error,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
