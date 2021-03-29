import 'package:flutter/material.dart';
import 'package:cuts/utils/const.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(PRIMARY_COLOR),
    );
  }
}
