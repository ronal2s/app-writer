import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/enums/user.enum.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieSignup extends StatefulWidget {
  final UserGender selected;
  final Function onSelect;
  LottieSignup({
    @required this.selected,
    @required this.onSelect,
  });
  @override
  _LottieSignupState createState() => _LottieSignupState();
}

class _LottieSignupState extends State<LottieSignup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: DEFAULT_PADDING,
        right: DEFAULT_PADDING,
        bottom: DEFAULT_PADDING,
      ),
      child: Column(
        children: [
          MyText(
            // '¿Quien eres?',
            'REGISTRO',
            fontSize: 18,
            color: SECONDARY_COLOR,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: DEFAULT_SPACE),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: PersonPhoto(
                  userGender: UserGender.male,
                  name: 'assets/lotties/gender_male.json',
                  selected: widget.selected == UserGender.male,
                  onSelect: () {
                    widget.onSelect(UserGender.male);
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: PersonPhoto(
                  userGender: UserGender.female,
                  name: 'assets/lotties/gender_female.json',
                  selected: widget.selected == UserGender.female,
                  onSelect: () {
                    widget.onSelect(UserGender.female);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PersonPhoto extends StatelessWidget {
  final String name;
  final bool selected;
  final Function onSelect;
  final UserGender userGender;

  PersonPhoto({
    @required this.name,
    this.selected = false,
    this.onSelect,
    this.userGender,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double profileSize = size.width * 0.55;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        onTap: () {
          onSelect();
        },
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              margin: EdgeInsets.only(
                top: DEFAULT_SPACE,
              ),
              // height: profileSize,
              // width: profileSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: BACKGROUND_COLOR,
                border: Border.all(
                  width: 2,
                  color: selected ? PRIMARY_COLOR : Colors.transparent,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 10,
                    spreadRadius: selected ? 3 : 0,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Lottie.asset(
                  name,
                  width: profileSize,
                ),
              ),
            ),
            MyText(
              userGender.name,
              // fontSize: 16,
            )
          ],
        ),
      ),
    );
  }
}
