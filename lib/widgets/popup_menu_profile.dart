import 'package:flutter/material.dart';
import 'package:cuts/utils/enums/enums.dart';
import 'package:cuts/utils/functions.dart';

class PopupMenuProfile extends StatelessWidget {
  void onSelectMenuProfile(Map item) {
    item['onPressed']();
  }

  @override
  Widget build(BuildContext context) {
    void openTerms(BuildContext context) {}

    void openProfile(BuildContext context) {}

    void openSubscription(BuildContext context) {}

    final List<Map> contextMenuProfile = [
      {'title': 'Perfil', 'onPressed': () => openProfile(context)},
      {'title': 'Subscripción', 'onPressed': () => openSubscription(context)},
      {'title': 'Privacidad & Términos', 'onPressed': () => openTerms(context)},
      {
        'title': 'Cerrar Sesión',
        'onPressed': () {
          deletePrefs(key: SecureKeys.userId.value);
          Navigator.of(context).popAndPushNamed('/');
        }
      },
    ];

    return PopupMenuButton(
      icon: Icon(Icons.account_circle_rounded),
      onSelected: onSelectMenuProfile,
      itemBuilder: (context) {
        return contextMenuProfile.map((item) {
          return PopupMenuItem(
            value: item,
            child: Text(item['title']),
          );
        }).toList();
      },
    );
  }
}
