import 'package:cuts/widgets/material_image.dart';
import 'package:flutter/material.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';
import 'package:cuts/widgets/textfield_container.dart';
import 'package:cuts/widgets/textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomersHomeHeader extends StatefulWidget {
  final Function onChangeSearch;

  CustomersHomeHeader({Key key, this.onChangeSearch});

  @override
  _CustomersHomeHeaderState createState() => _CustomersHomeHeaderState();
}

class _CustomersHomeHeaderState extends State<CustomersHomeHeader> {
  final String url =
      'https://www.flowww.net/hubfs/Q3_Campa%C3%B1as%20Septiembre_2018/Septiembre%20Q3%202018/BLOG_ES/5-iideas-para-decorar-tu-barberia-flowww.png';

  final List<String> ads = [
    'https://blog.agendapro.com/hubfs/Barberia.png',
    'https://i.pinimg.com/originals/89/1f/05/891f055e228204d96f7b72de6a4f2327.png',
    'https://www.3claveles.com/img/cms/barberia2.jpg',
    'https://www.flowww.net/hubfs/Campa%C3%B1a%20marketing%20Octubre%20Q4/BLOG_ES/como-hacer-promociones-que-traigan-ingresos-para-tu-barberia.png'
  ];

  double svgHeight = 1500;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final Size size = MediaQuery.of(context).size;
      // Timer(Duration(milliseconds: 50), () {
      setState(() {
        svgHeight = size.height * 0.4;
      });
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        AnimatedContainer(
          // curve: Curves.bounceOut,
          duration: Duration(seconds: 2),
          // height: size.height * 0.4,
          height: svgHeight,
          // width: 500,
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/home.svg',
                width: size.width,
                height: size.height,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        'PUBLICIDAD',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: DEFAULT_SPACE),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          // direction: Axis.horizontal,
                          spacing: 10,
                          children: ads
                              .map((e) => MaterialImageTap(
                                  imgUrl: e, width: 200, height: 100))
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 160,
                // bottom: 50,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFieldContainer(
                    child: MyTextField(
                      label: "Buscar",
                      border: InputBorder.none,
                      onChanged: widget.onChangeSearch,
                      icon: Icon(Icons.search),
                    ),
                    boxShadow: BoxShadow(
                      // offset: Offset(0, 10),
                      // blurRadius: 50,
                      offset: Offset(0, 10),
                      blurRadius: 15,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
