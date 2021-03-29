import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String initialValue;
  // final String id;
  final Function onSaved;
  final Function onChanged;
  final bool isRequired;
  final bool isPassword;
  final InputBorder border;
  final Color fillColor;
  final Color textColor;
  final Icon icon;
  final bool autoGrow;
  final bool capitalization;
  final TextInputType keyboardType;
  final bool readOnly;
  final Function validator;
  final Function onEditingComplete;
  final Widget suffixIcon;
  final String hintText;
  final TextInputAction textInputAction;

  const MyTextField({
    Key key,
    this.label,
    this.initialValue,
    this.capitalization = false,
    this.keyboardType,
    this.validator,
    this.hintText,
    // this.id,
    this.onSaved,
    this.onChanged,
    this.isPassword = false,
    this.isRequired = false,
    this.border = const UnderlineInputBorder(),
    this.fillColor,
    this.textColor,
    this.icon,
    this.autoGrow = false,
    this.readOnly = false,
    this.suffixIcon,
    this.textInputAction,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      textCapitalization: TextCapitalization.sentences,
      initialValue: initialValue,
      keyboardType: keyboardType,
      maxLines: autoGrow ? null : 1,
      obscureText: isPassword is bool && isPassword,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      onChanged: (value) => onChanged is Function ? onChanged(value) : () {},
      decoration: InputDecoration(
        labelText: label,
        border: border,
        hintText: hintText,
        fillColor: fillColor,
        filled: fillColor is Color,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
      ),
      style: TextStyle(
        color: textColor,
      ),
      validator: validator is Function
          ? (value) => validator(value)
          : (value) {
              return value.isEmpty && isRequired ? "Campo requerido" : null;
            },
      onSaved: (value) {
        if (onSaved is Function) {
          onSaved(value);
        }
        // onSaved is Function ? onSaved(id, value) : null;
      },
    );
  }
}
