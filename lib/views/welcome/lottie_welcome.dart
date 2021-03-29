import 'package:cuts/utils/const.dart';
import 'package:cuts/views/welcome/title_welcome.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: DEFAULT_SPACE * 12),
      child: Column(
        children: [
          TitleWelcome(),
          Lottie.asset(
            'assets/lotties/write2.json',
            width: size.height * 0.4,
          ),
        ],
      ),
    );
  }
}
