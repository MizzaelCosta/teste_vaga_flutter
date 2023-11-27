import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../constants/color.dart';
import '../home_controller.dart';
import 'note.dart';

class NoteList extends StatelessWidget {
  const NoteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height * 0.3;
    const borderRadius = BorderRadius.all(Radius.circular(8.0));
    final controller = context.read<HomeController>();

    return Container(
      height: heigth,
      decoration: const BoxDecoration(
        color: white,
        borderRadius: borderRadius,
      ),
      child: Observer(
        builder: (_) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.noteList.length,
            itemBuilder: (_, index) {
              return Note(index);
            },
          );
        },
      ),
    );
  }
}
