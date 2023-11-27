import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga_flutter/src/constants/text.dart';
import 'package:teste_vaga_flutter/src/widgets/privacy_policy.dart';

void main() {
  testWidgets(
    'deve ser encontrado o texto clicável "Política de Privacidade"',
    (tester) async {
      const url = 'htts://google.com.br';
      final widget = MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: PrivacyPolicy(
                context,
                url: url,
              ),
            );
          },
        ),
      );

      await tester.pumpWidget(widget);
      final label = find.text(privacyPolicyLabel);
      final textButtom = find.byType(TextButton);
      expect(label, findsOneWidget);
      expect(textButtom, findsOneWidget);
    },
  );
}
