import 'package:cuts/api/api.dart';
import 'package:cuts/api/api_models.dart';
import 'package:cuts/utils/enums/user.enum.dart';
import 'package:cuts/utils/functions.dart';
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

    void newAccount() async {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        user.fechaNacimiento = '1990-01-01';
        ResponseError responseError = await requestSignup(userModel: user);
        if (responseError.error) {
          showSnackBar(
            context,
            content: Text(responseError.nameError),
            color: Colors.red,
          );
        }
      } else {
        showSnackBar(
          context,
          content: Text('Usuario registrado'),
          color: Colors.green,
        );
        popView(context);
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
                    SizedBox(height: DEFAULT_SPACE * 10),
                    // LottieSignup(
                    //   selected: userGender,
                    //   onSelect: onSelecTypetUser,
                    // ),
                    MyText(
                      'REGISTRO',
                      fontSize: 18,
                      color: PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFieldContainer(
                            child: MyTextField(
                              label: "Nombres",
                              border: InputBorder.none,
                              isRequired: true,
                              icon: Icon(Icons.person, color: PRIMARY_COLOR),
                              onSaved: (value) => user.nombre = value,
                            ),
                          ),
                          TextFieldContainer(
                            child: MyTextField(
                              label: "Apellidos",
                              border: InputBorder.none,
                              isRequired: true,
                              icon: Icon(Icons.person, color: PRIMARY_COLOR),
                              onSaved: (value) => user.apellido = value,
                            ),
                          ),
                          TextFieldContainer(
                            child: MyTextField(
                              label: "Correo",
                              border: InputBorder.none,
                              keyboardType: TextInputType.emailAddress,
                              isRequired: true,
                              icon: Icon(Icons.email, color: PRIMARY_COLOR),
                              onSaved: (value) => user.correo = value,
                            ),
                          ),
                          TextFieldContainer(
                            child: MyTextField(
                              label: "Contraseña",
                              border: InputBorder.none,
                              icon: Icon(Icons.lock, color: PRIMARY_COLOR),
                              isRequired: true,
                              isPassword: true,
                              onChanged: (value) => user.password = value,
                            ),
                          ),
                          TextFieldContainer(
                            child: MyTextField(
                              label: "Confirmar Contraseña",
                              border: InputBorder.none,
                              icon: Icon(Icons.lock, color: PRIMARY_COLOR),
                              isRequired: true,
                              isPassword: true,
                              onSaved: (value) => user.confPassword = value,
                              validator: (value) {
                                if (value != user.password) {
                                  return 'Las contraseñas deben coincidir';
                                }
                              },
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
                            color: Colors.red[200],
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // BottomSignUp(),
          ],
        ),
      ),
    );
  }
}
