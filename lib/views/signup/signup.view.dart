import 'package:cuts/utils/enums/user.enum.dart';
import 'package:cuts/views/signup/bottom_signup.dart';
import 'package:cuts/views/signup/lottie_signup.dart';
import 'package:flutter/material.dart';
import 'package:cuts/models/user.model.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/views/signup/background_signup.dart';
import 'package:cuts/views/signup/components/orDivider.dart';
import 'package:cuts/widgets/rounded_button.dart';
import 'package:cuts/widgets/text.dart';
import 'package:cuts/widgets/textfield_container.dart';
import 'package:cuts/widgets/textfield.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final formKey = new GlobalKey<FormState>();
  final UserModel user = UserModel();
  UserGender userGender;

  void onSelecTypetUser(UserGender selected) {
    setState(() {
      userGender = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    void openLogin() {
      Navigator.pop(context);
    }

    void newAccount() {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        formKey.currentState.reset();
      }
    }

    return Scaffold(
      body: BackgroundSignup(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: DEFAULT_SPACE * 5),
                    LottieSignup(
                      selected: userGender,
                      onSelect: onSelecTypetUser,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFieldContainer(
                            child: MyTextField(
                              label: "Nombres",
                              border: InputBorder.none,
                              keyboardType: TextInputType.number,
                              isRequired: true,
                              icon: Icon(Icons.person, color: PRIMARY_COLOR),
                              onSaved: (value) => user.user = value,
                            ),
                          ),
                          TextFieldContainer(
                            child: MyTextField(
                              label: "Teléfono",
                              border: InputBorder.none,
                              keyboardType: TextInputType.number,
                              isRequired: true,
                              icon:
                                  Icon(Icons.smartphone, color: PRIMARY_COLOR),
                              onSaved: (value) => user.user = value,
                            ),
                          ),
                          TextFieldContainer(
                            child: MyTextField(
                              label: "Contraseña",
                              border: InputBorder.none,
                              icon: Icon(Icons.lock, color: PRIMARY_COLOR),
                              isRequired: true,
                              isPassword: true,
                              onSaved: (value) => user.password = value,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RoundedButton(
                      // color: SECONDARY_COLOR,
                      text: "REGISTRARSE",
                      onPressed: newAccount,
                    ),
                    OrDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          "¿Tiene una cuenta? ",
                          color: PRIMARY_COLOR,
                        ),
                        GestureDetector(
                          onTap: openLogin,
                          child: MyText(
                            "Iniciar sesión",
                            color: SECONDARY_COLOR,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            BottomSignUp(),
          ],
        ),
      ),
    );
  }
}
