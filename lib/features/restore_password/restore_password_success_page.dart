import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/login/login_page.dart';

class RestorePasswordSuccessPage extends StatelessWidget {
  const RestorePasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_noOrange.png'),
            fit: BoxFit.cover,
          ),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 0.0, right: 25.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 32,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: 'A new password has been sent to you'),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 14.0, left: 30.0, right: 30.0),
                  child: Text(
                    'You can now use the new password to access your account safely and securely',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(36, 36, 36, 0.5),
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Visibility(
                        visible: true,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const LoginPage()));
                          },
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 52,
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.92,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              gradient: const LinearGradient(
                                begin: Alignment(0.0, -1.0),
                                end: Alignment(1.0, 1.0),
                                colors: [
                                  Color.fromRGBO(164, 171, 155, 1),
                                  Color.fromRGBO(164, 171, 155, 1)
                                ],
                                stops: [0.0, 1.0],
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'To Log in',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Gilroy',
                                      fontSize: 16,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      
    );
  }
}
