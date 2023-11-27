import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../constants/color.dart';
import '../../constants/style.dart';
import '../../constants/text.dart';
import '../../widgets/gradient_background_color.dart';
import '../../widgets/input_text.dart';
import 'components/notes_list.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<HomeController>()..getListNotes();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    if (controller.reset) {
      _formKey.currentState?.reset();
      controller.onReset(value);
    }
  }

  void _onFieldSubmitted(String value) {
    if (_formKey.currentState!.validate()) {
      controller.saveSubmittedValue(value);
    }
    controller.resetValidate(true);
    _focusNode.requestFocus();
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
                key: _formKey,
                child: InputText(
                  hintText: hintText,
                  hintStyle: textStyleBlack16Bold,
                  controller: controller.textField,
                  validator: Validatorless.required(validatorErrorMessage),
                  focusNode: _focusNode,
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
