import 'package:cuts/api/api.dart';
import 'package:cuts/api/api_models.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/baul/components/baulCard.dart';
import 'package:cuts/views/home/components/home_button.dart';
import 'package:cuts/views/journal/journal_form.view.dart';
import 'package:cuts/widgets/circle_button.dart';
import 'package:cuts/widgets/elevated_button.dart';
import 'package:cuts/widgets/keyboard_container.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaulView extends StatefulWidget {
  @override
  _BaulViewState createState() => _BaulViewState();
}

class _BaulViewState extends State<BaulView> {
  final formKey = GlobalKey<FormState>();
  bool loading = true;
  bool loadingSendingResponse = false;
  List<PracticaGratitud> questions = [];
  Map answers = {};

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    ResponseGratitud responseGratitud = await requestGratitud();
    if (responseGratitud.error) {
      showSnackBar(
        context,
        content: Text('No hay preguntas disponibles el día de hoy'),
        color: Colors.red,
      );
      setState(() {
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
        questions = responseGratitud.data;
        responseGratitud.data.forEach((element) {
          answers[element.pregunta] = '';
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void sendData() async {
      try {
        setState(() {
          loadingSendingResponse = true;
        });
        for (var i = 0; i < questions.length; i++) {
          PracticaGratitud element = questions[i];
          RespondGratitud respondGratitud = RespondGratitud(
            idPract: element.idPract,
            texto: answers[element.pregunta],
          );
          if (answers[element.pregunta].length > 0) {
            ResponseError response = await sendRespondGratitud(respondGratitud);
            if (i == 0 || response.error) {
              if (!response.error) {
                showSnackBar(
                  context,
                  content: Text(response.message),
                  color: Colors.green,
                );
              } else {
                showSnackBar(
                  context,
                  content: Text(response.nameError),
                  color: Colors.red,
                );
              }
            }
          }
        }
        setState(() {
          loadingSendingResponse = false;
        });
      } catch (error) {
        showSnackBar(context,
            content: Text('Ha ocurrido un error'), color: Colors.red);
      }
    }

    void onEndPractice() async {
      for (var i = 0; i < questions.length; i++) {
        PracticaGratitud element = questions[i];
        if (answers[element.pregunta].split(' ').length < 2 ||
            answers[element.pregunta].length == 0) {
          showSnackBar(
            context,
            content: Text('Cada respuesta debe contener al menos dos palabras'),
            color: Colors.red,
          );
          return;
        }
      }

      showAlert(context,
          title: 'Antes de continuar...',
          content: Container(
            height: size.height * 0.15,
            child: Column(
              children: [
                MyText(
                  '¿Le gustaría escribir en su Journal sobre lo que ha reflexionado?',
                  color: PRIMARY_COLOR,
                ),
                SizedBox(height: DEFAULT_SPACE * 2),
                HomeButton(
                  height: 50,
                  fontSize: 18,
                  iconSize: 24,
                  icon: Icons.add,
                  text: 'Entrada Nueva',
                  onPressed: () {
                    sendData();
                    popView(context);
                    popView(context);
                    pushView(context, view: JournalForm());
                  },
                ),
              ],
            ),
          ),
          buttons: [
            TextButton(
              onPressed: () {
                sendData();
                popView(context);
                popView(context);
              },
              child: Text('Finalizar práctica'),
              style: TextButton.styleFrom(primary: PRIMARY_COLOR),
            ),
          ]);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Baúl de gratitud'),
      ),
      body: KeyboardContainer(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(DEFAULT_PADDING),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: DEFAULT_SPACE),
                  questions.length > 0
                      ? MyText(
                          'Desliza',
                          color: PRIMARY_COLOR,
                          fontSize: 16,
                        )
                      : SizedBox(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      children: [
                        loading ? CircularProgressIndicator() : SizedBox(),
                        ...questions.map(
                          (e) => BaulCard(
                            label: e.pregunta,
                            onChanged: (value) {
                              answers[e.pregunta] = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: DEFAULT_SPACE),
                  questions.length > 0
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: loadingSendingResponse
                              ? CircularProgressIndicator()
                              : CircleButton(
                                  size: 50,
                                  icon: Icon(Icons.check, color: Colors.white),
                                  onPressed: onEndPractice,
                                ),
                        )
                      : SizedBox(),
                  questions.length == 0 && !loading
                      ? MyText('No hay preguntas disponibles el día de hoy')
                      : SizedBox(),
                  // MyElevatedButton(
                  //   text: 'Finalizar práctica',
                  //   onPressed: onEndPractice,
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
