import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CalculateNameWidget extends StatelessWidget {
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
        top: 766,
        left: 72,
        child: Container(
          decoration: BoxDecoration(),
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Don`t have an account ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(36, 36, 36, 1),
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(36, 36, 36, 1),
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 730,
        left: 120,
        child: Text(
          'Forgot my password',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(36, 36, 36, 1),
            fontFamily: 'Gilroy',
            fontSize: 16,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1,
          ),
        ),
      ),
      Positioned(
        top: 486,
        left: 16,
        child: Container(
            width: 358,
            height: 52,
            decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
          offset: Offset(1, 3),
          blurRadius: 9,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment(0.8375781774520874, 0.015026814304292202),
        end: Alignment(-0.015026813372969627, 0.017671197652816772),
        colors: [
          Color.fromRGBO(89, 167, 167, 1),
          Color.fromRGBO(175, 205, 109, 1)
        ],
      ),
    ),
    child: Stack(
    children: <Widget>[
    Positioned(
    top: 17,
    left: 161,
    child: Text(
    'Next',
    textAlign: TextAlign.left,
    style: TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Gilroy',
    fontSize: 16,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
    height: 1,
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    Positioned(
    top: 216,
    left: 46,
    child: Text(
    'Create your User Name',
    textAlign: TextAlign.center,
    style: TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'Gilroy',
    fontSize: 28,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
    height: 1,
    ),
    ),
    ),
    Positioned(
    top: 282,
    left: 99,
    child: Text(
    'My name is...',
    textAlign: TextAlign.left,
    style: TextStyle(
    color: Color.fromRGBO(36, 36, 36, 1),
    fontFamily: 'Gilroy',
    fontSize: 32,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
    height: 1,
    ),
    ),
    ),
    Positioned(
    top: 121,
    left: 16,
    child: Container(
    decoration: BoxDecoration(),
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    child: Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
    Text(
    'Questions:',
    textAlign: TextAlign.left,
    style: TextStyle(
    color: Color.fromRGBO(36, 36, 36, 1),
    fontFamily: 'Gilroy',
    fontSize: 18,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
    height: 1,
    ),
    ),
    SizedBox(width: 8),
    Text(
    '1/39',
    textAlign: TextAlign.left,
    style: TextStyle(
    color: Color.fromRGBO(36, 36, 36, 1),
    fontFamily: 'Gilroy',
    fontSize: 18,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
    height: 1,
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    );
  }
}


class CalculateAchieveWidget extends StatelessWidget {
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
            top: 216,
            left: 17,
            child: Text(
              'Do you have health goals you want to achieve this month?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(36, 36, 36, 1),
                fontFamily: 'Gilroy',
                fontSize:  28,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 121,
            left: 16,
            child: Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Questions:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(36, 36, 36, 1),
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '1/39',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(36, 36, 36, 1),
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CalculateGenderWidget extends StatelessWidget {
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
            top: 734,
            left: 16,
            child: Container(
              width: 358,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.09),
                    offset: Offset(1, 3),
                    blurRadius: 9,
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment(0.8375781774520874, 0.015026814304292202),
                  end: Alignment(-0.015026813372969627, 0.017671197652816772),
                  colors: [
                    Color.fromRGBO(89, 167, 167, 1),
                    Color.fromRGBO(175, 205, 109, 1)
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 216,
            left: 15,
            child: Text(
              'Please indicate your gender',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Gilroy',
                fontSize: 28,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: 282,
            left: 149,
            child: Text(
              'I am...',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(36, 36, 36, 1),
                fontFamily: 'Gilroy',
                fontSize: 32,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          buildGenderOption(top: 357, left: 16, assetPath: 'assets/images/male.svg'),
          buildGenderOption(top: 357, left: 138, assetPath: 'assets/images/female.svg'),
          buildGenderOption(top: 357, left: 260, assetPath: 'assets/images/other.svg'),
          Positioned(
            top: 121,
            left: 16,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Questions:',
                  style: TextStyle(
                    color: Color.fromRGBO(36, 36, 36, 1),
                    fontFamily: 'Gilroy',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '1/39',
                  style: TextStyle(
                    color: Color.fromRGBO(36, 36, 36, 1),
                    fontFamily: 'Gilroy',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGenderOption({required double top, required double left, required String assetPath}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 114,
        height: 114,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.09),
              offset: Offset(1, 3),
              blurRadius: 9,
            ),
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            semanticsLabel: 'gender icon',
          ),
        ),
      ),
    );
  }
}

class CalculateAgeWidget extends StatelessWidget {
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
            top: 486,
            left: 16,
            child: buildNextButton(),
          ),
          Positioned(
            top: 216,
            left: 80,
            child: Text(
              'How old are you?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Gilroy',
                fontSize: 28,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: 121,
            left: 16,
            child: buildQuestionHeader(),
          ),
          Positioned(
            top: 336,
            left: 16,
            child: buildAgeSelector(),
          ),
          Positioned(
            top: 282,
            left: 179,
            child: Text(
              '19',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(23, 23, 23, 1),
                fontFamily: 'Gilroy',
                fontSize: 32,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNextButton() {
    return Container(
      width: 358,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(1, 3),
            blurRadius: 9,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(0.8375781774520874, 0.015026814304292202),
          end: Alignment(-0.015026813372969627, 0.017671197652816772),
          colors: [
            Color.fromRGBO(89, 167, 167, 1),
            Color.fromRGBO(175, 205, 109, 1)
          ],
        ),
      ),
      child: Center(
        child: Text(
          'Next',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Gilroy',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget buildQuestionHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Questions:',
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(width: 8),
          Text(
            '1/39',
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAgeSelector() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Age',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 4),
          buildDateInput('Day', '23', Color.fromRGBO(252, 108, 76, 1)),
          buildDateInput('Month', '10', Color.fromRGBO(36, 36, 36, 1)),
          buildDateInput('Year', '2022', Color.fromRGBO(36, 36, 36, 1)),
        ],
      ),
    );
  }

  Widget buildDateInput(String label, String value, Color valueColor) {
    return Container(
      width: 358,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(1, 3),
            blurRadius: 9,
          ),
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
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

class CalculateHightWidget extends StatelessWidget {
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
            top: 216,
            left: 74,
            child: Text(
              'What is your Height?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Gilroy',
                fontSize: 28,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: 282,
            left: 140,
            child: Text(
              '155/cm',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(23, 23, 23, 1),
                fontFamily: 'Gilroy',
                fontSize: 32,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: 121,
            left: 16,
            child: buildQuestionsHeader(),
          ),
          Positioned(
            top: 336,
            left: 16,
            child: buildHeightSelector(),
          ),
          Positioned(
            top: 486,
            left: 16,
            child: buildNextButton(),
          ),
        ],
      ),
    );
  }

  Widget buildQuestionsHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Questions:',
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(width: 8),
          Text(
            '1/39',
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeightSelector() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Height',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 4),
          buildHeightInput(),
        ],
      ),
    );
  }

  Widget buildHeightInput() {
    List<int> heights = [170, 171, 172, 173, 174];
    List<Widget> heightWidgets = heights
        .map((height) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        height.toString(),
        style: TextStyle(
          color: Color.fromRGBO(36, 36, 36, 1),
          fontFamily: 'Gilroy',
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    ))
        .toList();

    return Container(
      width: 358,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(1, 3),
            blurRadius: 9,
          ),
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ...heightWidgets,
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.09),
                  offset: Offset(1, 3),
                  blurRadius: 9,
                ),
              ],
              color: Color.fromRGBO(252, 108, 76, 1),
            ),
            child: Center(
              child: Text(
                '175',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNextButton() {
    return Container(
      width: 358,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(1, 3),
            blurRadius: 9,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(0.8375781774520874, 0.015026814304292202),
          end: Alignment(-0.015026813372969627, 0.017671197652816772),
          colors: [
            Color.fromRGBO(89, 167, 167, 1),
            Color.fromRGBO(175, 205, 109, 1)
          ],
        ),
      ),
      child: Center(
        child: Text(
          'Next',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Gilroy',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class CalculateWeightWidget extends StatelessWidget {
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
            top: 216,
            left: 68,
            child: Text(
              'What\'s your weight?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Gilroy',
                fontSize: 28,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: 282,
            left: 154,
            child: Text(
              '85 kg',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(36, 36, 36, 1),
                fontFamily: 'Gilroy',
                fontSize: 32,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: 121,
            left: 16,
            child: buildQuestionsHeader(),
          ),
          Positioned(
            top: 336,
            left: 16,
            child: buildWeightSelector(),
          ),
          Positioned(
            top: 486,
            left: 16,
            child: buildNextButton(),
          ),
        ],
      ),
    );
  }

  Widget buildQuestionsHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Questions:',
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(width: 8),
          Text(
            '1/39',
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWeightSelector() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Weight',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 4),
          buildWeightInput(),
        ],
      ),
    );
  }

  Widget buildWeightInput() {
    List<int> weights = [80, 81, 82, 83, 84];
    List<Widget> weightWidgets = weights
        .map((weight) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        weight.toString(),
        style: TextStyle(
          color: Color.fromRGBO(36, 36, 36, 1),
          fontFamily: 'Gilroy',
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    ))
        .toList();

    return Container(
      width: 358,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(1, 3),
            blurRadius: 9,
          ),
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ...weightWidgets,
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.09),
                  offset: Offset(1, 3),
                  blurRadius: 9,
                ),
              ],
              color: Color.fromRGBO(252, 108, 76, 1),
            ),
            child: Center(
              child: Text(
                '85',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNextButton() {
    return Container(
      width: 358,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(1, 3),
            blurRadius: 9,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(0.8375781774520874, 0.015026814304292202),
          end: Alignment(-0.015026813372969627, 0.017671197652816772),
          colors: [
            Color.fromRGBO(89, 167, 167, 1),
            Color.fromRGBO(175, 205, 109, 1)
          ],
        ),
      ),
      child: Center(
        child: Text(
          'Next',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Gilroy',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class CalculateAlergicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 911,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 60,
            left: 318,
            child: buildSkipButton(),
          ),
          Positioned(
            top: 301,
            left: 16,
            child: buildAllergenList(),
          ),
          Positioned(
            top: 801,
            left: 16,
            child: buildNextButton(),
          ),
          Positioned(
            top: 216,
            left: 34,
            child: buildTitleSection(),
          ),
          Positioned(
            top: 121,
            left: 16,
            child: buildQuestionsHeader(),
          ),
        ],
      ),
    );
  }

  Widget buildSkipButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: Color.fromRGBO(57, 126, 229, 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        'Skip',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontFamily: 'Gilroy',
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget buildAllergenList() {
    List<String> allergens = ['Dairy', 'Nuts', 'Gluten', 'Shellfish', 'Soy', 'Eggs'];
    List<Widget> allergenWidgets = allergens
        .map((allergen) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: buildAllergenItem(allergen),
    ))
        .toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          buildCustomOptionField(),
          ...allergenWidgets,
        ],
      ),
    );
  }

  Widget buildCustomOptionField() {
    return Container(
      width: 358,
      height: 100,
      decoration: buildBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Add your option separated by commas',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color.fromRGBO(36, 36, 36, 1),
            fontFamily: 'Gilroy',
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.09),
          offset: Offset(1, 3),
          blurRadius: 9,
        ),
      ],
      color: Color.fromRGBO(255, 255, 255, 1),
    );
  }

  Widget buildAllergenItem(String allergen) {
    return Container(
      width: 358,
      height: 52,
      decoration: buildBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          allergen,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color.fromRGBO(36, 36, 36, 1),
            fontFamily: 'Gilroy',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget buildNextButton() {
    return Container(
      width: 358,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(1, 3),
            blurRadius: 9,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(0.8375781774520874, 0.015026814304292202),
          end: Alignment(-0.015026813372969627, 0.017671197652816772),
          colors: [
            Color.fromRGBO(89, 167, 167, 1),
            Color.fromRGBO(175, 205, 109, 1)
          ],
        ),
      ),
      child: Center(
        child: Text(
          'Next',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Gilroy',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
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
            'What are you allergic to?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Gilroy',
              fontSize: 28,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'If you are not allergic, skip this step.',
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

  Widget buildQuestionsHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Questions:',
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(width: 8),
          Text(
            '1/39',
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
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

class CalculateMentalWidget extends StatelessWidget {
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
            top: 734,
            left: 16,
            child: buildNextButton(),
          ),
          Positioned(
            top: 308,
            left: 16,
            child: buildMentalHealthOptions(),
          ),
          Positioned(
            top: 216,
            left: 17,
            child: buildTitleSection(),
          ),
        ],
      ),
    );
  }

  Widget buildNextButton() {
    return Container(
      width: 358,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(1, 3),
            blurRadius: 9,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(0.8375781774520874, 0.015026814304292202),
          end: Alignment(-0.015026813372969627, 0.017671197652816772),
          colors: [
            Color.fromRGBO(89, 167, 167, 1),
            Color.fromRGBO(175, 205, 109, 1)
          ],
        ),
      ),
      child: Center(
        child: Text(
          'Next',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Gilroy',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget buildMentalHealthOptions() {
    List<String> options = [
      'Improve concentration',
      'Reduce stress and anxiety',
      'Develop healthy habits',
      'Fight insomnia'
    ];
    List<Widget> optionWidgets = options
        .map((option) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: buildOptionItem(option),
    ))
        .toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: optionWidgets,
      ),
    );
  }

  Widget buildOptionItem(String option) {
    return Container(
      width: 358,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(1, 3),
            blurRadius: 9,
          ),
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          option,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color.fromRGBO(36, 36, 36, 1),
            fontFamily: 'Gilroy',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
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
            'Mental Health',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 28,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Select a target',
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
}
