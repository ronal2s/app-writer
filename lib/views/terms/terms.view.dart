import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class TermsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Términos & Condiciones'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(DEFAULT_PADDING * 2),
        child: Column(
          children: [
            MyText(
              'Términos y condiciones',
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            SizedBox(height: DEFAULT_SPACE * 2),
            MyText(
              'Aware podría ser un gran complemento para las terapias y tratamientos psicológicos, sin embargo, no está destinada a ser un sustituto de ellas, sino un soporte; tornándolas más eficientes mediante la capacidad de presentar y compartir los datos del estado de ánimo y emociones más frecuentes con médicos, consejeros y/o terapeutas, contribuyendo a compartir dicha información para controlar los síntomas o apoyar un posible diagnóstico. ',
              color: PRIMARY_COLOR,
              fontSize: 16,
            ),
            SizedBox(height: DEFAULT_SPACE),
            MyText(
              'Además, es una herramienta idónea para personas que buscan mejorar su bienestar mental; Aprendiendo a conocer y gestionar sus emociones formando la coyuntura en la que se encuentran la cognición y la emoción, facilitando su capacidad de resistencia, motivación, empatía, razonamiento, manejo del estrés, comunicación y su capacidad de leer y navegar en una gran cantidad de situaciones y conflictos sociales.',
              color: PRIMARY_COLOR,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
