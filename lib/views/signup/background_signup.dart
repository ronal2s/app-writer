import 'package:flutter/material.dart';

class BackgroundSignup extends StatelessWidget {
  final Widget child;
  const BackgroundSignup({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode focusScopeNode = FocusScope.of(context);
        if (!focusScopeNode.hasPrimaryFocus) {
          focusScopeNode.unfocus();
        }
      },
      child: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
                "assets/signup_top.png",
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(
                "assets/main_bottom.png",
                width: size.width * 0.35,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
