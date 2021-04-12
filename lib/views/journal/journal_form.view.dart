import 'package:cuts/api/api.dart';
import 'package:cuts/api/api_models.dart';
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
class JournalForm extends StatefulWidget {
  final JournalModel editJournalItem;

  JournalForm({
    this.editJournalItem,
  });

  @override
  _JournalFormState createState() => _JournalFormState();
}

class _JournalFormState extends State<JournalForm> {
  final formKey = GlobalKey<FormState>();
  final today = DateTime.now();
  bool loading = false;
  JournalModel journalModel = JournalModel();

  @override
  void initState() {
    super.initState();
    if (widget.editJournalItem != null) {
      journalModel = widget.editJournalItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    final Size size = MediaQuery.of(context).size;

    void onCreate() async {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        setState(() {
          loading = true;
        });
        if (widget.editJournalItem == null) {
          ResponseError response = await createJournal(journalModel);
          if (!response.error) {
            showSnackBar(context,
                content: Text('Journal creado!'), color: Colors.green);
          } else {
            showSnackBar(context,
                content: Text('Ha ocurrido un error'), color: Colors.red);
            setState(() {
              loading = false;
            });
          }
        } else {
          ResponseError response = await updateJournal(
            id: widget.editJournalItem.id,
            content: journalModel.texto,
          );
          if (!response.error) {
            showSnackBar(
              context,
              content: Text(response.message),
              color: Colors.green,
            );
            popView(context);
            popView(context);
            popView(context);
          } else {
            showSnackBar(context,
                content: Text(response.nameError), color: Colors.red);
            setState(() {
              loading = false;
            });
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Entrada'),
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
                        color: PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                      ),
                      Lottie.asset(
                        'assets/lotties/girl_with_cellphone.json',
                        width: size.width * 0.8,
                      ),
                      MyTextField(
                        readOnly: widget.editJournalItem != null,
                        initialValue: journalModel.titulo,
                        isRequired: true,
                        border: OutlineInputBorder(),
                        label: 'Título',
                        onSaved: (value) {
                          journalModel.titulo = value;
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          node.nextFocus();
                        },
                      ),
                      SizedBox(height: DEFAULT_SPACE),
                      MyTextField(
                        readOnly: widget.editJournalItem != null,
                        initialValue: journalModel.sentimiento,
                        isRequired: true,
                        border: OutlineInputBorder(),
                        label: 'Sentimientos',
                        onSaved: (value) {
                          journalModel.sentimiento = value;
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          node.nextFocus();
                        },
                      ),
                      SizedBox(height: DEFAULT_SPACE),
                      MyTextField(
                        initialValue: journalModel.texto,
                        isRequired: true,
                        autoGrow: true,
                        border: OutlineInputBorder(),
                        minLines: 3,
                        label: 'Contenido',
                        validator: (value) {
                          if (value.allMatches(' ').length < 2 ||
                              value.length == 0) {
                            return 'Debe contener al menos dos palabras';
                          }
                        },
                        onSaved: (value) {
                          journalModel.texto = value;
                        },
                      ),
                      SizedBox(height: DEFAULT_SPACE),
                      MyElevatedButton(
                        fullWidth: true,
                        // height: 50,
                        text: 'Guardar',
                        onPressed: onCreate,
                        loading: loading,
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
