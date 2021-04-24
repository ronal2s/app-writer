import 'package:cuts/api/api.dart';
import 'package:cuts/api/api_models.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/home/components/home_button.dart';
import 'package:cuts/views/journal/journal_form.view.dart';
import 'package:cuts/views/phrases/components/phraseCard.dart';
import 'package:cuts/widgets/elevated_button.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PhrasesView extends StatefulWidget {
  @override
  _PhrasesViewState createState() => _PhrasesViewState();
}

class _PhrasesViewState extends State<PhrasesView> {
  List<Phrase> phrases = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    ResponsePhrases responsePhrases = await requestPhrases();
    if (responsePhrases.error) {
      showSnackBar(context,
          content: Text(responsePhrases.message), color: Colors.red);
      setState(() {
        loading = false;
      });
    } else {
      setState(() {
        phrases = responsePhrases.data;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void onEndPractice() {
      showAlert(context,
          title: 'Antes de continuar...',
          content: Container(
            height: size.height * 0.15,
            child: Column(
              children: [
                MyText(
                  '¿Le gustaría escribir en su Journal sobre lo que ha aprendido?',
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
        title: Text('Frases'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lotties/woman_thinking.json',
              width: size.width * 0.6,
            ),
            MyText(
              'Desliza',
              color: PRIMARY_COLOR,
              fontSize: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                children: [
                  loading? CircularProgressIndicator(): SizedBox(),
                  ...phrases.map(
                    (e) => PhraseCard(text: '${e.frase}\n\n— ${e.autor}'),
                  )
                ],
              ),
            ),
            SizedBox(height: DEFAULT_SPACE),
            MyElevatedButton(
              text: 'Finalizar práctica',
              onPressed: onEndPractice,
            )
          ],
        ),
      ),
    );
  }
}
