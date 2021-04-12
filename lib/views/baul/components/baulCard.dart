import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';
import 'package:cuts/widgets/textfield.dart';
import 'package:flutter/material.dart';

class BaulCard extends StatelessWidget {
  final String label;
  final String placeholder;
  final String value;
  final Function onChanged;

  BaulCard({
    @required this.label,
    this.value,
    this.onChanged,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        minHeight: size.height * 0.3,
        maxWidth: size.width * 0.95,
      ),
      child: Card(
        child: Padding(
            padding: EdgeInsets.all(DEFAULT_PADDING * 2),
            child: Column(
              children: [
                MyText(
                  label,
                  color: PRIMARY_COLOR,
                  fontSize: 16,
                ),
                SizedBox(height: DEFAULT_SPACE),
                MyTextField(
                  label: '',
                  autoGrow: true,
                  minLines: 20,
                  border: OutlineInputBorder(),
                  hintText: placeholder,
                  onChanged: onChanged,
                )
              ],
            )),
      ),
    );
  }
}
