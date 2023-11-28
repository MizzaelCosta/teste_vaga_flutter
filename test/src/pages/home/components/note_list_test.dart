import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:teste_vaga_flutter/src/constants/color.dart';
import 'package:teste_vaga_flutter/src/pages/home/components/note.dart';
import 'package:teste_vaga_flutter/src/pages/home/components/note_list.dart';
import 'package:teste_vaga_flutter/src/pages/home/home_controller.dart';

class HomeControllerMockEmpty extends Mock implements HomeController {
  @override
  ObservableList<String> get noteList => <String>[].asObservable();
}

class HomeControllerMock extends Mock implements HomeController {
  @override
  ObservableList<String> get noteList =>
      <String>['text-1', 'text-2'].asObservable();
}

void main() {
  testWidgets(
    'deve mostrar nenhum item (lista vazia)',
    (tester) async {
      final widget = Provider<HomeController>(
        create: (_) => HomeControllerMockEmpty(),
        child: const MaterialApp(home: NoteList()),
      );

      await tester.pumpWidget(widget);

      final card = find.byType(Note);
      expect(card, findsNothing);
    },
  );

  testWidgets(
    'deve mostrar os N itens da "noteList"',
    (tester) async {
      final n = HomeControllerMock().noteList.length;
      final widget = Provider<HomeController>(
        create: (_) => HomeControllerMock(),
        child: const MaterialApp(home: NoteList()),
      );

      await tester.pumpWidget(widget);

      final card = find.byType(Note);
      final text1 = find.text('text-1');
      final text2 = find.text('text-2');

      expect(card, findsNWidgets(n));
      expect(text1, findsOneWidget);
      expect(text2, findsOneWidget);
    },
  );

  testWidgets(
    'deve retornar a cor branca e borda de raio igual a 8',
    (tester) async {
      const borderRadius = BorderRadius.all(Radius.circular(8.0));
      const expectDecoration = BoxDecoration(
        color: white,
        borderRadius: borderRadius,
      );

      final widget = Provider<HomeController>(
        create: (_) => HomeControllerMockEmpty(),
        child: const MaterialApp(home: NoteList()),
      );

      await tester.pumpWidget(widget);

      final finder = find.byType(Container);
      final Container container = tester.widget(finder);
      final decoration = container.decoration;

      expect(finder, findsOneWidget);
      expect(decoration, equals(expectDecoration));
    },
  );
}
