import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga_flutter/src/constants/color.dart';
import 'package:teste_vaga_flutter/src/widgets/show_message.dart';

void main() {
  group(
    'testa o showSnackBarError',
    () {
      testWidgets(
          'deve ser encontrada uma snackBar de erro, com a menssagem recebida, após ação de toque',
          (tester) async {
        const message = 'hello World';
        const key = Key('tap-key');
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return GestureDetector(
                    key: key,
                    onTap: () {
                      Message.showSnackBarError(
                        context: context,
                        message: message,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );

        expect(find.text(message), findsNothing);
        expect(find.byType(SnackBar), findsNothing);

        final tap = find.byKey(key);
        await tester.tap(tap);
        await tester.pumpAndSettle();

        expect(find.text(message), findsOneWidget);
        expect(find.byType(SnackBar), findsOneWidget);
      });

      testWidgets(
        'deve ser ocultada a primeira snackBar de erro e mostrada a segunda logo após nova a ação de toque',
        (tester) async {
          int count = 0;
          const key = Key('tap-key');
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    return GestureDetector(
                      key: key,
                      onTap: () {
                        count++;
                        Message.showSnackBarError(
                          context: context,
                          message: 'message$count',
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );

          expect(find.text('message1'), findsNothing);
          expect(find.byType(SnackBar), findsNothing);

          final tap = find.byKey(key);
          await tester.tap(tap);
          await tester.tap(tap);
          await tester.pumpAndSettle();

          expect(find.text('message1'), findsNothing);
          expect(find.text('message2'), findsOneWidget);
          expect(find.byType(SnackBar), findsOneWidget);
        },
      );

      testWidgets(
        'a snackBar deve ser da cor vermelha',
        (tester) async {
          const message = 'red';
          const key = Key('tap-key');
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    return GestureDetector(
                      key: key,
                      onTap: () {
                        Message.showSnackBarError(
                          context: context,
                          message: message,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );

          final tap = find.byKey(key);
          await tester.tap(tap);
          await tester.pumpAndSettle();

          final finder = find.byType(SnackBar);
          final SnackBar snackBar = tester.widget(finder);

          expect(snackBar.backgroundColor, equals(red));
        },
      );
    },
  );

  group(
    'testa o showSnackBarAlert',
    () {
      testWidgets(
          'deve ser encontrada uma snackBar de alerta, com a menssagem recebida, após ação de toque',
          (tester) async {
        const message = 'hello World';
        const key = Key('tap-key');
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return GestureDetector(
                    key: key,
                    onTap: () {
                      Message.showSnackBarAlert(
                        context: context,
                        message: message,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );

        expect(find.text(message), findsNothing);
        expect(find.byType(SnackBar), findsNothing);

        final tap = find.byKey(key);
        await tester.tap(tap);
        await tester.pumpAndSettle();

        expect(find.text(message), findsOneWidget);
        expect(find.byType(SnackBar), findsOneWidget);
      });

      testWidgets(
        'deve ser ocultada a primeira snackBar de alerta e mostrada a segunda logo após nova a ação de toque',
        (tester) async {
          int count = 0;
          const key = Key('tap-key');
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    return GestureDetector(
                      key: key,
                      onTap: () {
                        count++;
                        Message.showSnackBarError(
                          context: context,
                          message: 'message$count',
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );

          expect(find.text('message1'), findsNothing);
          expect(find.byType(SnackBar), findsNothing);

          final tap = find.byKey(key);
          await tester.tap(tap);
          await tester.tap(tap);
          await tester.pumpAndSettle();

          expect(find.text('message1'), findsNothing);
          expect(find.text('message2'), findsOneWidget);
          expect(find.byType(SnackBar), findsOneWidget);
        },
      );

      testWidgets(
        'a snackBar deve ser da cor cinza escuro',
        (tester) async {
          const message = 'grey';
          const key = Key('tap-key');
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    return GestureDetector(
                      key: key,
                      onTap: () {
                        Message.showSnackBarAlert(
                          context: context,
                          message: message,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );

          final tap = find.byKey(key);
          await tester.tap(tap);
          await tester.pumpAndSettle();

          final finder = find.byType(SnackBar);
          final SnackBar snackBar = tester.widget(finder);

          expect(snackBar.backgroundColor, equals(grey));
        },
      );
    },
  );
}
