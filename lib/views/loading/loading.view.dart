import 'package:cuts/utils/enums/enums.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/container/container.view.dart';
import 'package:cuts/views/welcome/welcome.view.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatefulWidget {
  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    var userId = await getPrefs(key: SecureKeys.userId.value);
    if(userId != null ) {
      replaceView(context, view: ContainerView());
    } else {
      replaceView(context, view: WelcomeView());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}