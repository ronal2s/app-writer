import 'package:cuts/models/user.model.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/textfield.dart';
import 'package:cuts/widgets/textfield_container.dart';
import 'package:flutter/material.dart';

class FormWelcome extends StatefulWidget {
  final bool isVisible;
  FormWelcome({
    this.isVisible = false,
  });
  @override
  _FormWelcomeState createState() => _FormWelcomeState();
}

class _FormWelcomeState extends State<FormWelcome> {
  double height = 0;
  UserModel user = UserModel();
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceOut,
                height: widget.isVisible ? INPUT_HEIGHT : 0,
                child: TextFieldContainer(
                  child: MyTextField(
                    isRequired: true,
                    label: "Teléfono",
                    border: InputBorder.none,
                    keyboardType: TextInputType.number,
                    icon: widget.isVisible
                        ? Icon(Icons.person, color: PRIMARY_COLOR)
                        : null,
                    onSaved: (value) => user.user = value,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.bounceOut,
                height: widget.isVisible ? INPUT_HEIGHT : 0,
                child: TextFieldContainer(
                  child: MyTextField(
                    isRequired: true,
                    isPassword: true,
                    label: "Contraseña",
                    border: InputBorder.none,
                    icon: widget.isVisible
                        ? Icon(Icons.lock, color: PRIMARY_COLOR)
                        : null,
                    onSaved: (value) => user.password = value,
                  ),
                ),
              ),
              // MyRaisedButton(
              //   color: PRIMARY_COLOR,
              //    "Submit",
              //   onPressed: onSigninView,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
