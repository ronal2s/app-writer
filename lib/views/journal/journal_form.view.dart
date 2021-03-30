import 'package:cuts/models/journal.model.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/widgets/keyboard_container.dart';
import 'package:cuts/widgets/elevated_button.dart';
import 'package:cuts/widgets/text.dart';
import 'package:cuts/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class JournalForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final today = DateTime.now();
  JournalModel journalModel = JournalModel();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Journal'),
      ),
      body: KeyboardContainer(
        child: Container(
          padding: EdgeInsets.all(DEFAULT_PADDING),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: DEFAULT_SPACE),
                      MyText(
                        toCapitalize(DateFormat.MMMMEEEEd('es').format(today)),
                        fontSize: 16,
                      ),
                      Lottie.asset(
                        'assets/lotties/girl_with_cellphone.json',
                        width: size.width * 0.8,
                      ),
                      MyTextField(
                        isRequired: true,
                        border: OutlineInputBorder(),
                        label: 'Título',
                        onSaved: (value) {
                          journalModel.title = value;
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          node.nextFocus();
                        },
                      ),
                      SizedBox(height: DEFAULT_SPACE),
                      MyTextField(
                        isRequired: true,
                        border: OutlineInputBorder(),
                        label: 'Sentimientos',
                        onSaved: (value) {
                          journalModel.feelings = value;
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          node.nextFocus();
                        },
                      ),
                      SizedBox(height: DEFAULT_SPACE),
                      MyTextField(
                        isRequired: true,
                        autoGrow: true,
                        border: OutlineInputBorder(),
                        label: 'Contenido',
                        onSaved: (value) {
                          journalModel.description = value;
                        },
                      ),
                      SizedBox(height: DEFAULT_SPACE),
                      MyElevatedButton(
                        fullWidth: true,
                        // height: 50,
                        text: 'Agregar',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
