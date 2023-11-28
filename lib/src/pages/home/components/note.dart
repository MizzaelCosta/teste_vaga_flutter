import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_vaga_flutter/src/constants/style.dart';

import '../../../constants/color.dart';
import '../../../constants/text.dart';
import '../home_controller.dart';

class Note extends StatelessWidget {
  const Note(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HomeController>();

    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            controller.noteList[index],
            textAlign: TextAlign.center,
            style: textStyleBlack16Bold,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                key: Key('editButtom-key$index'),
                iconSize: iconSize36,
                icon: const Icon(Icons.border_color_rounded),
                onPressed: () {
                  controller.editNote(index);
                },
              ),
              IconButton(
                key: Key('removeButtom-key$index'),
                iconSize: iconSize36,
                icon: const Icon(Icons.cancel, color: red),
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(alertDialogTitle),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            alertDialogCancel,
                            style: textStyleBlack,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.removeNote(index);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            alertDialogConfirm,
                            style: textStyleBlack,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
