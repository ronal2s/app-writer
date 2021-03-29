import 'package:cuts/widgets/keyboard_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cuts/utils/const.dart';

class BackgroundWelcome extends StatelessWidget {
  final Widget child;
  BackgroundWelcome({this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: -5,
            top: 0,
            child: SvgPicture.asset(
              "assets/top_left_corner.svg",
              width: size.width * 0.5,
              color: PRIMARY_COLOR,
            ),
          ),
          Positioned(
            right: 0,
            bottom: -20,
            child: SvgPicture.asset(
              "assets/bottom_right_corner.svg",
              width: size.width * 0.40,
              color: PRIMARY_COLOR,
            ),
          ),
          KeyboardContainer(
            child: child,
          )
        ],
      ),
    );
  }
}
