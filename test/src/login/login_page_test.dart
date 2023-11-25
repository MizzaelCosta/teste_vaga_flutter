import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga_flutter/src/app.dart';
import 'package:teste_vaga_flutter/src/constants/text.dart';
import 'package:teste_vaga_flutter/src/pages/home/home_page.dart';

void main() {
  group('teste da loginPage', () {
    group('testes do campo usário', () {
      testWidgets(
        'deve encontrar o campo usuario',
        (widgetTester) async {
          await widgetTester.pumpWidget(const App());

          final user = find.byKey(const Key('user_key'));
          expect(user, findsOneWidget);
        },
      );

      testWidgets(
        'deve encontrar mensagem para usuário vazio',
        (widgetTester) async {
          await widgetTester.pumpWidget(const App());

          final loginButton = find.byKey(const Key('login_button_key'));
          await widgetTester.tap(loginButton);
          await widgetTester.pumpAndSettle();

          expect(find.text(userEmptyMessage), findsOneWidget);
        },
      );

      testWidgets(
        'deve encontrar mensagem para usuário com mais de 20 carateres',
        (widgetTester) async {
          await widgetTester.pumpWidget(const App());

          final user = find.byKey(const Key('user_key'));
          await widgetTester.tap(user);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(user, 'testo com mais de 20 caracteres');
          await widgetTester.pumpAndSettle();

          final loginButton = find.byKey(const Key('login_button_key'));
          await widgetTester.tap(loginButton);
          await widgetTester.pumpAndSettle();

          expect(find.text(maxCharMessage), findsOneWidget);
        },
      );

      testWidgets(
        'não deve encontrar mensagens para validação do campo usuário',
        (widgetTester) async {
          await widgetTester.pumpWidget(const App());

          final user = find.byKey(const Key('user_key'));
          await widgetTester.tap(user);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(user, 'user');
          await widgetTester.pumpAndSettle();

          final loginButton = find.byKey(const Key('login_button_key'));
          await widgetTester.tap(loginButton);
          await widgetTester.pumpAndSettle();

          expect(find.text(userEmptyMessage), findsNothing);
          expect(find.text(maxCharMessage), findsNothing);
        },
      );
    });
  });

  group('testes do campo senha', () {
    testWidgets(
      'deve encontrar o campo senha',
      (tester) async {
        await tester.pumpWidget(
          const App(),
        );

        final password = find.byKey(const Key('password_key'));
        expect(password, findsOneWidget);
      },
    );
    testWidgets(
      'deve encontrar mensagem para senha vazia',
      (widgetTester) async {
        await widgetTester.pumpWidget(const App());

        final loginButton = find.byKey(const Key('login_button_key'));
        await widgetTester.tap(loginButton);
        await widgetTester.pumpAndSettle();

        expect(find.text(passwordEmptyMessage), findsOneWidget);
      },
    );

    testWidgets(
      'deve encontrar mensagem para senha com menos de 2 carateres',
      (widgetTester) async {
        await widgetTester.pumpWidget(const App());

        final password = find.byKey(const Key('password_key'));
        await widgetTester.tap(password);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(password, 's');
        await widgetTester.pumpAndSettle();

        final loginButton = find.byKey(const Key('login_button_key'));
        await widgetTester.tap(loginButton);
        await widgetTester.pumpAndSettle();

        expect(find.text(passwordMinCharMessage), findsOneWidget);
      },
    );

    testWidgets(
      'deve encontrar mensagem para senha com mais de 20 carateres',
      (widgetTester) async {
        await widgetTester.pumpWidget(const App());

        final password = find.byKey(const Key('password_key'));
        await widgetTester.tap(password);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(
            password, 'senha com mais de 20 caracteres');
        await widgetTester.pumpAndSettle();

        final loginButton = find.byKey(const Key('login_button_key'));
        await widgetTester.tap(loginButton);
        await widgetTester.pumpAndSettle();

        expect(find.text(maxCharMessage), findsOneWidget);
      },
    );

    testWidgets(
      'não deve encontrar mensagens de validação do campo senha',
      (widgetTester) async {
        await widgetTester.pumpWidget(const App());

        final password = find.byKey(const Key('password_key'));
        await widgetTester.tap(password);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(password, 'senha');
        await widgetTester.pumpAndSettle();

        final loginButton = find.byKey(const Key('login_button_key'));
        await widgetTester.tap(loginButton);
        await widgetTester.pumpAndSettle();

        expect(find.text(passwordEmptyMessage), findsNothing);
        expect(find.text(passwordMinCharMessage), findsNothing);
        expect(find.text(maxCharMessage), findsNothing);
      },
    );
  });

  group('testes do botão de login', () {
    testWidgets(
      'deve encontrar mensagens de usuário incorreto',
      (widgetTester) async {
        await widgetTester.pumpWidget(const App());

        final user = find.byKey(const Key('user_key'));
        await widgetTester.tap(user);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(user, 'admi');
        await widgetTester.pumpAndSettle();

        final password = find.byKey(const Key('password_key'));
        await widgetTester.tap(password);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(password, '123');
        await widgetTester.pumpAndSettle();

        final loginButton = find.byKey(const Key('login_button_key'));
        await widgetTester.tap(loginButton);
        await widgetTester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
      },
    );

    testWidgets(
      'deve encontrar mensagens de senha incorreta',
      (widgetTester) async {
        await widgetTester.pumpWidget(const App());

        final user = find.byKey(const Key('user_key'));
        await widgetTester.tap(user);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(user, 'admin');
        await widgetTester.pumpAndSettle();

        final password = find.byKey(const Key('password_key'));
        await widgetTester.tap(password);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(password, '12');
        await widgetTester.pumpAndSettle();

        final loginButton = find.byKey(const Key('login_button_key'));
        await widgetTester.tap(loginButton);
        await widgetTester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
      },
    );

    testWidgets(
      'não deve encontrar mensagens de usuário/senha incorretos',
      (widgetTester) async {
        await widgetTester.pumpWidget(const App());

        final user = find.byKey(const Key('user_key'));
        await widgetTester.tap(user);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(user, 'admin');
        await widgetTester.pumpAndSettle();

        final password = find.byKey(const Key('password_key'));
        await widgetTester.tap(password);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(password, '123');
        await widgetTester.pumpAndSettle();

        final loginButton = find.byKey(const Key('login_button_key'));
        await widgetTester.tap(loginButton);
        await widgetTester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);
      },
    );
  });
}
