import 'package:flutter/material.dart';

class ExpansionPanelItem {
  ExpansionPanelItem({
    this.id,
    this.title,
    this.subtitle,
    this.body,
    this.isExpanded = false,
  });
  int id;
  Widget title;
  Text subtitle;
  Widget body;
  bool isExpanded;
}
