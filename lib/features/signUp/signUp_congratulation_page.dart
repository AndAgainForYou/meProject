import 'package:flutter/material.dart';

class SignUpCongratulationPage extends StatelessWidget {
  const SignUpCongratulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 100,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, size: 24), // Adjust the icon size
                  SizedBox(width: 8),
                  Text(
                    "Back",
                    style: TextStyle(fontSize: 16), // Adjust the text size
                  ),
                ],
              ),
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 200,
                      height: 140,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, top: 35.0, right: 30.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 32,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Congratulations ! You have ',
                        ),
                        TextSpan(
                          text: 'registered.',
                          style: TextStyle(
                            color: Colors.green,
                            
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
                  child: Text(
                    "Let's continue our acquaintance, let's find out your details in order to prepare offers for you",
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
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 190.0),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 52,
                    maxWidth: 335,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    gradient: const LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(1.0, 1.0),
                      colors: [Color(0xFF59A7A7), Color(0xFFAFCD6D)],
                      stops: [0.0, 1.0],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Let`s Start !',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Transform.rotate(
                            angle: 329.9,
                            child: const Icon(
                              Icons.arrow_back,
                              color: Color.fromRGBO(255, 255, 255, 1),
                              size: 20,
                            ),
                          ),
                        )
                      ],
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
