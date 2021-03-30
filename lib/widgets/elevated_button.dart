import 'package:cuts/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:cuts/widgets/text.dart';

class MyElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool loading;
  final Color color;
  final double height;
  final double textSize;
  final Icon icon;
  final double spaceBetweenIcon;
  final Image image;
  final bool fullWidth;

  const MyElevatedButton({
    Key key,
    this.onPressed,
    this.loading = false,
    this.icon,
    this.textSize,
    this.image,
    this.fullWidth = false,
    this.spaceBetweenIcon,
    @required this.text,
    this.color = PRIMARY_COLOR,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textStyle: TextStyle(
              foreground: Paint()
                ..color = color.computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white,
            )),
        onPressed: onPressed is Function && !loading ? onPressed : null,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: loading ? 10 : 0,
          children: [
            MyText(
              text,
              fontSize: textSize,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
            loading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Theme.of(context).scaffoldBackgroundColor),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
