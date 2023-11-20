import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_vaga_flutter/src/constants/style.dart';
import 'package:teste_vaga_flutter/src/pages/home/home_controller.dart';
import 'package:teste_vaga_flutter/src/widgets/gradient_background_color.dart';
import 'package:teste_vaga_flutter/src/widgets/input_text.dart';
import 'package:validatorless/validatorless.dart';

import '../../constants/color.dart';
import '../../constants/text.dart';
import 'components/notes_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  late TextEditingController textField;
  late HomeController controller;
  bool reset = false;

  void _onChanged(String value) {
    if (reset) {
      formKey.currentState?.reset();
      controller.setTextField(value);
      resetValidate(false);
    }
  }

  void resetValidate(bool value) => reset = value;

  void _onFieldSubmitted(String value) {
    if (formKey.currentState!.validate()) {
      controller.onSubmitted(value);
    }
    resetValidate(true);
    focusNode.requestFocus();
  }

  @override
  void initState() {
    super.initState();
    controller = context.read<HomeController>()..getListNotes();
    textField = controller.textField!;
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    textField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.width * 0.1;
    const borderRadius = BorderRadius.all(Radius.circular(8.0));
    final heigth = MediaQuery.of(context).size.height * 0.3;

    return Scaffold(
      body: GradientBackgroundColor(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              Container(
                height: heigth,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: borderRadius,
                ),
                child: Observer(
                  builder: (_) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listNotes.length,
                      itemBuilder: (_, index) {
                        return NotesList(index);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 36.0),
              Form(
                key: formKey,
                child: InputText(
                  hintText: hintText,
                  hintStyle: textStyleBlack16Bold,
                  controller: textField,
                  validator: Validatorless.required(errorMessageValidator),
                  focusNode: focusNode,
                  onChanged: _onChanged,
                  onFieldSubmitted: _onFieldSubmitted,
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
