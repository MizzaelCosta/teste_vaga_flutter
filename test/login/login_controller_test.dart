import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga_flutter/src/pages/login/login_controller.dart';

main() {
  group('teste função login', () {
    final controller = LoginController();
    const userFail = 'adimn';
    const user = 'admin';
    const passwordFail = '124';
    const password = '123';
    test('login com usuário e senha corretos', () {
      expect(null, controller.login(user: user, password: password));
    });

    test('login com usuário e senha incorretos', () {
      expect('Use Usuário: admin e Senha: 123.',
          controller.login(user: userFail, password: passwordFail));
    });

    test('login com usuário incorreto e senha correta', () {
      expect('Use Usuário: admin e Senha: 123.',
          controller.login(user: userFail, password: password));
    });

    test('login com usuário correto e senha incorreta', () {
      expect('Use Usuário: admin e Senha: 123.',
          controller.login(user: user, password: passwordFail));
    });
  });
}
