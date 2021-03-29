import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:cuts/widgets/text.dart';

class PopupMenuAlerts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Badge(
      showBadge: false,
      position: BadgePosition.bottomEnd(bottom: 5, end: 0),
      badgeContent: MyText(
        '3',
        color: Colors.white,
      ),
      child: IconButton(
        icon: Icon(Icons.notifications),
        onPressed: () {},
      ),
    );
  }
}
