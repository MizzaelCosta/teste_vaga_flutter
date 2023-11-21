import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga_flutter/src/pages/login/login_controller.dart';

main() {
  group('teste função login', () {
    final controller = LoginController();

    const userFail = 'adimn';
    const passwordFail = '124';
    const user = 'admin';
    const password = '123';
    const error = 'Use Usuário: admin e Senha: 123.';

    test('login com usuário e senha corretos', () {
      final atual = controller.login(user: user, password: password);
      expect(atual, null);
    });

    test('login com usuário e senha incorretos', () {
      final atual = controller.login(user: userFail, password: passwordFail);
      expect(atual, error);
    });

    test('login com usuário incorreto e senha correta', () {
      final atual = controller.login(user: userFail, password: password);
      expect(atual, error);
    });

    test('login com usuário correto e senha incorreta', () {
      final atual = controller.login(user: user, password: passwordFail);
      expect(atual, error);
    });
  });
}
