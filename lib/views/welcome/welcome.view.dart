import 'package:cuts/views/container/container.view.dart';
import 'package:cuts/views/welcome/form_welcome.dart';
import 'package:cuts/views/welcome/lottie_welcome.dart';
import 'package:cuts/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    hideStatusBar();
  }

  void onSignIn() {
    replaceView(context, view: ContainerView());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LottieWelcome(),
                    FormWelcome(isVisible: true),
                    SizedBox(
                      width: size.width * 0.6,
                      child: RoundedButton(
                        text: '${!isVisible ? 'Iniciar sesión' : 'Entrar'}'
                            .toUpperCase(),
                        color: PRIMARY_COLOR,
                        onPressed: onSignIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // BottomWelcome(onSignUpTap: () {
            //   setState(() {
            //     // isVisible = false;
            //   });
            // })
          ],
        ),
      ),
    );
  }
}
