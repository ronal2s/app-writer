import 'package:cuts/views/welcome/form_welcome.dart';
import 'package:cuts/views/welcome/lottie_welcome.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
