import 'package:flutter/material.dart';

class RestorePasswordWidget extends StatelessWidget {
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
            top: 691,
            left: 16,
            child: Container(
              width: 358,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
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
                  'Restore Password',
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
          Positioned(
            top: 302,
            left: 84,
            child: Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Let us help you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(36, 36, 36, 1),
                      fontFamily: 'Gilroy',
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Restore password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(36, 36, 36, 0.5),
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 396,
            left: 103,
            child: Container(
              width: 184,
              height: 172,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              // SVG Placeholder for Image Widget
              // Example SVG Image Widget
              child: SizedBox.shrink(),
            ),
          ),
          Positioned(
            top: 139,
            left: 101,
            child: Container(
              width: 151,
              height: 98.390625,
              // SVG Placeholder for Image Widget
              // Example SVG Image Widget
              child: SizedBox.shrink(),
            ),
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


class RestorePasswordDoneWidget extends StatelessWidget {
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
            top: 691,
            left: 16,
            child: Container(
              width: 358,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                    begin: Alignment(0.8375781774520874, 0.015026814304292202),
                    end: Alignment(-0.015026813372969627, 0.017671197652816772),
                    colors: [
                      Color.fromRGBO(89, 167, 167, 1),
                      Color.fromRGBO(175, 205, 109, 1)
                    ]
                ),
              ),
              child: Center(
                child: Text(
                  'To Log In',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 249,
            left: 38,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'A new password has been sent to you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(36, 36, 36, 1),
                        fontFamily: 'Gilroy',
                        fontSize: 32,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Follow the instructions in the email and try logging in again',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(36, 36, 36, 0.5),
                        fontFamily: 'Gilroy',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Other Positioned widgets including Text Fields and SVG Images
          // SVG Images need the flutter_svg package to be included in pubspec.yaml
          // The placeholders should be replaced with the actual SVG asset paths.
          // Additional Positioned Widgets...
          // Placeholder for missing widget
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox.shrink(),
          ),
          // Placeholder for missing widget
          Positioned(
            top: 810,
            left: 7,
            child: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
