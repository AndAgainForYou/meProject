import 'package:flutter/material.dart';


class ProVersionWidget extends StatelessWidget {
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
              top: -109.203125,
              left: -327.7430419921875,
              child: SizedBox.shrink()
          ),
          Positioned(
            top: 407,
            left: 16,
            child: Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                ],
              ),
            ),
          ),
          Positioned(
            top: 128,
            left: 113,
            child: Container(
              width: 151,
              height: 98.390625,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 29,
                    left: 0,
                    child: Container(
                      width: 149.5,
                      height: 69.390625,
                      child: Stack(
                        children: <Widget>[
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 31,
                      child: SizedBox.shrink()
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 71,
              left: 22,
              child: SizedBox.shrink()
          ),
          Positioned(
            top: 251,
            left: 16,
            child: Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: SizedBox.shrink()
          ),
        ],
      ),
    );
  }
}
