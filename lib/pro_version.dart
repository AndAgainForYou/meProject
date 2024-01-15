import 'package:flutter/material.dart';


class ProVersionWidget extends StatelessWidget {
  const ProVersionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 844,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          const Positioned(
              top: -109.203125,
              left: -327.7430419921875,
              child: SizedBox.shrink()
          ),
          Positioned(
            top: 407,
            left: 16,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                ],
              ),
            ),
          ),
          const Positioned(
            top: 128,
            left: 113,
            child: SizedBox(
              width: 151,
              height: 98.390625,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 29,
                    left: 0,
                    child: SizedBox(
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
          const Positioned(
              top: 71,
              left: 22,
              child: SizedBox.shrink()
          ),
          Positioned(
            top: 251,
            left: 16,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                ],
              ),
            ),
          ),
          const Positioned(
              top: 0,
              left: 0,
              child: SizedBox.shrink()
          ),
        ],
      ),
    );
  }
}
