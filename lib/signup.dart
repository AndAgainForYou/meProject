import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpWidget extends StatelessWidget {
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
            left: 67,
            child: Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Already have an account ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(23, 23, 23, 1),
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(89, 167, 167, 1),
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 462,
            left: 16,
            child: buildTextFieldContainer(
              context,
              'Enter your email',
              'assets/images/email_icon.svg', // Placeholder path
            ),
          ),
          Positioned(
            top: 538,
            left: 16,
            child: buildTextFieldContainer(
              context,
              'Enter your password',
              'assets/images/password_icon.svg', // Placeholder path
            ),
          ),
          Positioned(
            top: 614,
            left: 16,
            child: buildTextFieldContainer(
              context,
              'Repeat your password',
              'assets/images/repeat_password_icon.svg', // Placeholder path
            ),
          ),
          Positioned(
            top: 690,
            left: 16,
            child: Container(
              width: 358,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                    offset: Offset(1, 3),
                    blurRadius: 9,
                  ),
                ],
                color: Color.fromRGBO(194, 194, 194, 1),
              ),
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildTextFieldContainer(BuildContext context, String hintText, String iconPath) {
    return Container(
      width: 358,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
            offset: Offset(1, 3),
            blurRadius: 9,
          ),
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 17,
            left: 48,
            child: Text(
              hintText,
              style: TextStyle(
                color: Color.fromRGBO(23, 23, 23, 0.5),
                fontFamily: 'Gilroy',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 14,
            left: 16,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: SvgPicture.asset(
                iconPath,
                semanticsLabel: 'icon',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpCongratulationWidget extends StatelessWidget {
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
            top: 249,
            left: 20,
            child: Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Congratulations! You have registered.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black, // Replaced undefined with a valid color
                      fontFamily: 'Gilroy',
                      fontSize: 32,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Let's continue our acquaintance, let's find out your details in order to prepare offers for you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(36, 36, 36, 0.5),
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 690,
            left: 16,
            child: Container(
              width: 358,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
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
                  colors: [Color.fromRGBO(89, 167, 167, 1), Color.fromRGBO(175, 205, 109, 1)],
                ),
              ),
              child: Center(
                child: Text(
                  "Let's Start!",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
          // ... Other Positioned widgets
          // Placeholder for SVG Assets
          // Make sure you have the 'flutter_svg' package added to your pubspec.yaml file
          // and the SVG assets available in your project.
          // The placeholders should be replaced with the actual asset paths.
          // Positioned SVG Widgets here...
          Positioned(
            top: 55,
            left: 0,
            child: SizedBox.shrink(), // Placeholder for missing widget
          ),
          Positioned(
            top: 115,
            left: 101,
            child: SizedBox.shrink(), // Placeholder for SVG
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox.shrink(), // Placeholder for missing widget
          ),
          Positioned(
            top: 810,
            left: 7,
            child: SizedBox.shrink(), // Placeholder for missing widget
          ),
        ],
      ),
    );
  }
}
