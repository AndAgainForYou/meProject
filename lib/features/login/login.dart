import 'package:flutter/material.dart';
import 'dart:math' as math;


class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 662,
              left: 16,
              child: Container(
                width: 358,
                height: 52,
                decoration: const BoxDecoration(
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
                    )
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
                child: const Stack(
                  children: <Widget>[                  
                    Positioned(
                      top: 16,
                      left: 157,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          'Log In',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Gilroy',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 766,
              left: 72,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        'Don`t have an account ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(36, 36, 36, 1),
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                    SizedBox(width: 8),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(89, 167, 167, 1),
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 730,
              left: 120,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  'Forgot my password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(89, 167, 167, 1),
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
            ),
            Positioned(
              top: 510,
              left: 16,
              child: Container(
                width: 358,
                height: 52,
                decoration: const BoxDecoration(
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
                    )
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Stack(
                  children: <Widget>[
                    const Positioned(
                      top: 17,
                      left: 48,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          'Enter your email',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(23, 23, 23, 0.5),
                              fontFamily: 'Gilroy',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 14,
                      left: 16,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: const Stack(
                          children: <Widget>[
                            Positioned(
                              top: 4,
                              left: 2,
                              child: Icon(
                                Icons.email, // Using a placeholder Icon for SVG
                                size: 16,
                                color: Color.fromRGBO(0, 0, 0, 0.54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 586,
              left: 16,
              child: Container(
                width: 358,
                height: 52,
                decoration: const BoxDecoration(
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
                    )
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Stack(
                  children: <Widget>[
                    const Positioned(
                      top: 17,
                      left: 48,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          'Enter your password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(23, 23, 23, 0.5),
                              fontFamily: 'Gilroy',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 14,
                      left: 16,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: const Stack(
                          children: <Widget>[
                            Positioned(
                              top: 11,
                              left: 3,
                              child: Icon(
                                Icons.lock, // Using a placeholder Icon for SVG
                                size: 16,
                                color: Color.fromRGBO(0, 0, 0, 0.54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 422,
              left: 123,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                            offset: Offset(1, 3),
                            blurRadius: 9,
                          )
                        ],
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: const Stack(
                        children: <Widget>[
                          Positioned(
                            top: 12,
                            left: 12,
                            child: Icon(
                              Icons.facebook, // Using a placeholder Icon for SVG
                              size: 40,
                              color: Color.fromRGBO(0, 0, 0, 0.54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                            offset: Offset(1, 3),
                            blurRadius: 9,
                          )
                        ],
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: const Stack(
                        children: <Widget>[
                          Positioned(
                            top: 12,
                            left: 12,
                            child: Icon(
                              Icons.camera, // Using a placeholder Icon for SVG
                              size: 40,
                              color: Color.fromRGBO(0, 0, 0, 0.54),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 211,
              left: 101,
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
                            const Positioned(
                              top: 24.822702407836914,
                              left: 28.786436080932617,
                              child: Icon(
                                Icons.star, // Using a placeholder Icon for SVG
                                size: 50,
                                color: Color.fromRGBO(0, 0, 0, 0.54),
                              ),
                            ),
                            const Positioned(
                              top: 21.437795639038086,
                              left: 25.950942993164062,
                              child: Icon(
                                Icons.star, // Using a placeholder Icon for SVG
                                size: 30,
                                color: Color.fromRGBO(0, 0, 0, 0.54),
                              ),
                            ),
                            Positioned(
                              top: 13.638851165771484,
                              left: 0,
                              child: Transform.rotate(
                                angle: -21.58982008889786 * (math.pi / 180),
                                child: const Icon(
                                  Icons.star, // Using a placeholder Icon for SVG
                                  size: 50,
                                  color: Color.fromRGBO(0, 0, 0, 0.54),
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 23.694400787353516,
                              left: 28.20754623413086,
                              child: Icon(
                                Icons.star, // Using a placeholder Icon for SVG
                                size: 20,
                                color: Color.fromRGBO(0, 0, 0, 0.54),
                              ),
                            ),
                            const Positioned(
                              top: 13.539684295654297,
                              left: 40.61886978149414,
                              child: Icon(
                                Icons.star, // Using a placeholder Icon for SVG
                                size: 10,
                                color: Color.fromRGBO(0, 0, 0, 0.54),
                              ),
                            ),
                            const Positioned(
                              top: 27.643457412719727,
                              left: 42.31132125854492,
                              child: Icon(
                                Icons.star, // Using a placeholder Icon for SVG
                                size: 40,
                                color: Color.fromRGBO(0, 0, 0, 0.54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const Positioned(
                      top: 0,
                      left: 31,
                      child: Icon(
                        Icons.image, // Using a placeholder Icon for SVG
                        size: 100,
                        color: Color.fromRGBO(0, 0, 0, 0.54),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
