import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/settings/components/settingsButton.dart';
import 'package:cuts/views/terms/privacity.view.dart';
import 'package:cuts/views/terms/terms.view.dart';
import 'package:cuts/views/welcome/welcome.view.dart';
import 'package:cuts/widgets/elevated_button.dart';
import 'package:cuts/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void showAccountInfo() {
      showAlert(context,
          title: 'Información de la cuenta',
          content: SizedBox(
            height: size.height * 0.17,
            child: Column(
              children: [
                MyTextField(
                  label: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                SizedBox(height: DEFAULT_SPACE),
                MyElevatedButton(
                  fullWidth: true,
                  text: 'Guardar cambios',
                  onPressed: () {
                    popView(context);
                  },
                )
              ],
            ),
          ));
    }

    void showChangePassword() {
      showAlert(context,
          title: 'Cambiar contraseña',
          content: SizedBox(
            height: size.height * 0.33,
            child: Column(
              children: [
                MyTextField(
                  label: 'Contraseña actual',
                  border: OutlineInputBorder(),
                ),
                SizedBox(height: DEFAULT_SPACE),
                MyTextField(
                  label: 'Nueva contraseña',
                  border: OutlineInputBorder(),
                ),
                SizedBox(height: DEFAULT_SPACE),
                MyTextField(
                  label: 'Confirmar contraseña',
                  border: OutlineInputBorder(),
                ),
                SizedBox(height: DEFAULT_SPACE),
                MyElevatedButton(
                  fullWidth: true,
                  text: 'Guardar cambios',
                  onPressed: () {
                    popView(context);
                  },
                )
              ],
            ),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: Container(
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SettingsButton(
                text: 'Información de la cuenta',
                onPressed: showAccountInfo,
              ),
              SettingsButton(
                text: 'Cambiar contraseña',
                onPressed: showChangePassword,
              ),
              SettingsButton(text: 'Notificaciones'),
              SettingsButton(
                text: 'Términos & Condiciones',
                onPressed: () {
                  pushView(context, view: TermsView());
                },
              ),
              SettingsButton(
                text: 'Aviso de privacidad',
                onPressed: () {
                  pushView(context, view: PrivacityView());
                },
              ),
              SettingsButton(
                text: 'Cerrar sesión',
                color: Colors.blueGrey,
                onPressed: () {
                  replaceView(context, view: WelcomeView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
