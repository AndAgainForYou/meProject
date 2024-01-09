import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

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
            top: 287,
            left: -200,
            child: SizedBox.shrink(), // Placeholder for missing widget
          ),
          Positioned(
            top: 211,
            left: 72.14047241210938,
            child: SizedBox(
              width: 208.71910095214844,
              height: 136.00021362304688,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 40.0853385925293,
                    left: 0,
                    child: SizedBox(
                      width: 206.6457061767578,
                      height: 95.91487884521484,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 34.31087875366211,
                            left: 39.789886474609375,
                            child: SvgPicture.asset(
                              'assets/images/vector2.svg',
                              semanticsLabel: 'vector2',
                            ),
                          ),
                          Positioned(
                            top: 29.632186889648438,
                            left: 35.87050247192383,
                            child: SvgPicture.asset(
                              'assets/images/vector4.svg',
                              semanticsLabel: 'vector4',
                            ),
                          ),
                          Positioned(
                            top: 18.85223960876465,
                            left: 0,
                            child: Transform.rotate(
                              angle: -21.58982008889786 * (math.pi / 180),
                              child: SvgPicture.asset(
                                'assets/images/vector6.svg',
                                semanticsLabel: 'vector6',
                              ),
                            ),
                          ),
                          Positioned(
                            top: 32.75131607055664,
                            left: 38.98969268798828,
                            child: SvgPicture.asset(
                              'assets/images/vector5.svg',
                              semanticsLabel: 'vector5',
                            ),
                          ),
                          Positioned(
                            top: 18.71524429321289,
                            left: 56.14525604248047,
                            child: SvgPicture.asset(
                              'assets/images/vector1.svg',
                              semanticsLabel: 'vector1',
                            ),
                          ),
                          Positioned(
                            top: 38.20990753173828,
                            left: 58.48466110229492,
                            child: SvgPicture.asset(
                              'assets/images/vector3.svg',
                              semanticsLabel: 'vector3',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 42.849632263183594,
                    child: SvgPicture.asset(
                      'assets/images/platy.svg',
                      semanticsLabel: 'platy',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 738,
            left: 179,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 2.6666667461395264,
                    left: 2.666660785675049,
                    child: SvgPicture.asset(
                      'assets/images/vector.svg',
                      semanticsLabel: 'vector',
                    ),
                  ),
                  Positioned(
                    top: 2.6666667461395264,
                    left: 16,
                    child: SvgPicture.asset(
                      'assets/images/vector.svg',
                      semanticsLabel: 'vector',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            child: SizedBox.shrink(), // Placeholder for missing widget
          ),
          const Positioned(
            top: 810,
            left: 7,
            child: SizedBox.shrink(), // Placeholder for missing widget
          ),
        ],
      ),
    );
  }
}
