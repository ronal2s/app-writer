import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class MaterialImageTap extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;
  MaterialImageTap(
      {@required this.imgUrl, @required this.width, @required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height + 30,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              child: Material(
                // elevation: 2,
                color: Colors.transparent,
                child: Container(
                  width: width,
                  height: height,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(DEFAULT_PADDING),
              child: MyText('Publicidad acá de lo que sea'),
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
      ),
    );
  }
}
