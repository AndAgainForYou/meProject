import 'package:flutter/material.dart';
import 'package:platy/features/login/login_page.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 200,
            height: 270,
          ),
        ),
        const Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromRGBO(255, 163, 132, 1),
                ),
                backgroundColor: Colors.transparent,
                strokeWidth: 4,
              ),
            ))
      ],
    ));
  }
}
