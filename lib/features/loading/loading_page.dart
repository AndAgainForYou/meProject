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
            builder: (context) =>
                const LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 160.0),
                child: Image.asset('assets/images/logo.png',
                    width: 200, height: 140, fit: BoxFit.fitWidth),
              ),
            ),
          ),
           const Expanded(
            flex: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/loadingPage_food.png',
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment(0.0, 1.0),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 190.0),
                  child: SizedBox(
                    width: 32,
                    height: 32, 
                    child: CircularProgressIndicator(
                      strokeWidth: 3, 
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
