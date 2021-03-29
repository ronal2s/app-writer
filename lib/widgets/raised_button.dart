import 'package:flutter/material.dart';
import 'package:cuts/widgets/text.dart';

class MyRaisedButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color textColor;
  final bool loading;
  final Color color;
  final double height;
  final double textSize;
  final Icon icon;
  final double spaceBetweenIcon;
  final Image image;

  const MyRaisedButton({
    Key key,
    this.onPressed,
    this.loading = false,
    this.icon,
    this.textColor,
    this.textSize,
    this.image,
    this.spaceBetweenIcon,
    @required this.text,
    this.color,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed is Function && !loading ? onPressed : null,
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      // color: Theme.of(context).indicatorColor,
      // color: loading ? Colors.grey : Theme.of(context).accentColor,
      child: Row(
        mainAxisAlignment: icon != null || image != null
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          // icon is Icon ? icon : SizedBox(),
          icon is Icon
              ? Container(
                  width: 100,
                  // height: 80,
                  child: icon,
                )
              : SizedBox(),
          image is Image
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: image,
                )
              : SizedBox(),
          SizedBox(width: spaceBetweenIcon),
          Expanded(
            child: MyText(
              text,
              fontSize: textSize,
              color: textColor,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
          Row(
            children: loading is bool && loading
                ? [
                    SizedBox(width: 15),
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Theme.of(context).scaffoldBackgroundColor),
                      ),
                    ),
                  ]
                : [],
          )
        ],
      ),
    );
  }
}
