import 'package:cuts/api/api.dart';
import 'package:cuts/api/api_models.dart';
import 'package:cuts/models/user.model.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/enums/enums.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/container/container.view.dart';
import 'package:cuts/views/signup/signup.view.dart';
import 'package:cuts/widgets/keyboard_container.dart';
import 'package:cuts/widgets/rounded_button.dart';
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
  final formKey = new GlobalKey<FormState>();
  bool loading = false;

  RequestLogin loginModel = RequestLogin(
    correo: 'yorman@mail.com',
    password: 'hola123',
    // correo: '',
    // password: '',
  );

  onSignIn() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setState(() {
        loading = true;
      });
      ResponseLogin response = await requestLogin(loginModel: loginModel);
      print(response);
      if (!response.error) {
        savePrefs(
          key: SecureKeys.userId.value,
          value: response.idUsuario.toString(),
        );
        savePrefs(
          key: SecureKeys.fullname.value,
          value: response.fullname.toString(),
        );
        savePrefs(
          key: SecureKeys.email.value,
          value: response.correo,
        );
        savePrefs(
          key: SecureKeys.birthDate.value,
          value: response.fechaNacimiento,
        );
        replaceView(context, view: ContainerView());
      } else {
        showSnackBar(
          context,
          content: Text(response.nameError),
          color: Colors.red,
        );
      }
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return KeyboardContainer(
      child: Container(
        child: Form(
          key: formKey,
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
                      initialValue: loginModel.correo,
                      isRequired: true,
                      label: "Correo",
                      border: InputBorder.none,
                      keyboardType: TextInputType.emailAddress,
                      icon: widget.isVisible
                          ? Icon(Icons.mail, color: PRIMARY_COLOR)
                          : null,
                      onSaved: (value) => loginModel.correo = value,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.bounceOut,
                  height: widget.isVisible ? INPUT_HEIGHT : 0,
                  child: TextFieldContainer(
                    child: MyTextField(
                      initialValue: loginModel.password,
                      isRequired: true,
                      isPassword: true,
                      label: "Contraseña",
                      border: InputBorder.none,
                      icon: widget.isVisible
                          ? Icon(Icons.lock, color: PRIMARY_COLOR)
                          : null,
                      onSaved: (value) => loginModel.password = value,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.6,
                  child: RoundedButton(
                    text: 'Iniciar sesión'.toUpperCase(),
                    color: PRIMARY_COLOR,
                    onPressed: onSignIn,
                    loading: loading,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.6,
                  child: RoundedButton(
                    text: 'Registro'.toUpperCase(),
                    color: Colors.red[200],
                    onPressed: () {
                      pushView(context, view: SignUpView());
                    },
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
      ),
    );
  }
}
