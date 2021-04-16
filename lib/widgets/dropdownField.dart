import 'package:flutter/material.dart';

class MyDropdownField extends StatelessWidget {
  final List<String> items;
  final String label;
  final InputBorder border;
  final Function(String value) onSaved;
  final Function(String value) onChanged;
  final String value;
  final bool isRequired;

  const MyDropdownField({
    Key key,
    this.value,
    this.items,
    this.label,
    this.border,
    this.onSaved,
    this.isRequired,
    this.onChanged,
  }) : super(key: key);

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem> list = [];
    if (items is List && items.length > 0) {
      items.forEach((item) =>
          {list.add(DropdownMenuItem(child: Text(item), value: item))});
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      decoration: InputDecoration(border: border, labelText: label),
      items: getDropdownItems(),
      hint: Text(
        label,
        overflow: TextOverflow.fade,
      ),
      onChanged: onChanged is Function ? (value) => onChanged(value) : (e) {},
      validator: (value) {
        return value == null && isRequired is bool && isRequired
            ? 'Campo requerido'
            : null;
      },
      onSaved: onSaved is Function ? (value) => onSaved(value) : (value) {},
    );
  }
}
