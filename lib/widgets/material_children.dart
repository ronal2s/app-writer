import 'package:flutter/material.dart';

class MaterialTap extends StatelessWidget {
  final Widget children;
  final double width;
  final double height;
  MaterialTap(
      {@required this.children, @required this.width, @required this.height});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Material(
            elevation: 2,
            child: Container(
              width: width,
              height: height,
              // decoration: BoxDecoration(
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: AssetImage(url),
              // ),
              // ),
              child: children,
            ),
          ),
        ),
        Positioned(
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            // elevation: 2,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: width,
                height: height,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
