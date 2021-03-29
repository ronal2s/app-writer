import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/signup/signup.view.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class BottomSignUp extends StatelessWidget {
  final Function onSignUpTap;
  const BottomSignUp({
    this.onSignUpTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(bottom: DEFAULT_SPACE * 2),
        child: Column(
          children: [
            Wrap(
              direction: Axis.horizontal,
              children: [
                MyText(
                  '¿Eres una empresa? ',
                  color: PRIMARY_COLOR,
                ),
                GestureDetector(
                  child: MyText(
                    'Solicita formar parte',
                    color: SECONDARY_COLOR,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    pushView(context, view: SignUpView());
                    if (onSignUpTap != null) {
                      onSignUpTap();
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
