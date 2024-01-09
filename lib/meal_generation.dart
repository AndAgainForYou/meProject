import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MealGenerationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 844,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 426,
            left: 55,
            child: buildLoadingCircle(),
          ),
          Positioned(
            top: 249,
            left: 38,
            child: buildTitleSection(),
          ),
        ],
      ),
    );
  }

  Widget buildLoadingCircle() {
    return Container(
      width: 280,
      height: 280,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              'assets/images/vector.svg',
              semanticsLabel: 'vector',
            ),
          ),
          Positioned(
            top: 118,
            left: 106,
            child: buildLoadingText(),
          ),
        ],
      ),
    );
  }

  Widget buildLoadingText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '54%',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 36,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 0),
          Text(
            'Loading',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitleSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'We generate a meal plan for you',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 32,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Wait a bit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 0.5),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
