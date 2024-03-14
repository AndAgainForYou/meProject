import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/login/login_page.dart';

class SignUpCongratulationPage extends StatelessWidget {
  const SignUpCongratulationPage({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 35.0, right: 30.0),
                  child: Text(
                    'Congratulations! You have registered',
                    style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w600, height: 1.1),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 48.0, right: 48.0),
                  child: Text(
                    "Let's break the ice to get to know each other better…",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(36, 36, 36, 0.5),
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CalculateGlobalWidget()));
                  },
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: 56,
                      maxWidth: MediaQuery.of(context).size.width * 0.92,
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
                            'Start',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
