import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:teste_vaga_flutter/src/constants/text.dart';
import 'package:teste_vaga_flutter/src/pages/home/components/note.dart';
import 'package:teste_vaga_flutter/src/pages/home/home_controller.dart';

const note = 'texto-1';

class HomeControllerMock extends Mock implements HomeController {
  @override
  ObservableList<String> get noteList => <String>[note].asObservable();
}

void main() {
  const index = 0;
  final widget = Provider<HomeController>(
    create: (_) => HomeControllerMock(),
    child: const MaterialApp(home: Note(index)),
  );

  testWidgets(
    'deve encontrar 1 (um) card com um texto e dois botões',
    (tester) async {
      await tester.pumpWidget(widget);

      final card = find.byType(Card);
      final text = find.text(note);
      const editButtomKey = Key('editButtom-key$index');
      final editButtom = find.byKey(editButtomKey);
      const removeButtomKey = Key('removeButtom-key$index');
      final removeButtom = find.byKey(removeButtomKey);

      expect(card, findsOneWidget);
      expect(text, findsOneWidget);
      expect(editButtom, findsOneWidget);
      expect(removeButtom, findsOneWidget);
    },
  );

  testWidgets(
    'deve mostrar um showDialog ao clicar em "remover"',
    (tester) async {
      await tester.pumpWidget(widget);

      final alertDialog = find.byType(AlertDialog);
      final title = find.text(alertDialogTitle);
      final cancel = find.text(alertDialogCancel);
      final confirm = find.text(alertDialogConfirm);

      expect(alertDialog, findsNothing);
      expect(title, findsNothing);
      expect(cancel, findsNothing);
      expect(confirm, findsNothing);

      const removeButtomKey = Key('removeButtom-key$index');
      final removeButtom = find.byKey(removeButtomKey);
      await tester.tap(removeButtom);
      await tester.pumpAndSettle();

      expect(alertDialog, findsOneWidget);
      expect(title, findsOneWidget);
      expect(cancel, findsOneWidget);
      expect(confirm, findsOneWidget);
    },
  );
}
