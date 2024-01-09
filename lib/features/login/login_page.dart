import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 20.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 98,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Handle Facebook login
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white, // Set your preferred color
                          boxShadow: const [
                            BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                              offset: Offset(1, 3),
                              blurRadius: 9,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Image.asset(
                            'assets/images/facebook_logo.png',
                            height: 36,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Handle Google login
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white, // Set your preferred color
                          boxShadow: const [
                            BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                              offset: Offset(1, 3),
                              blurRadius: 9,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Image.asset(
                            'assets/images/google_logo.png',
                            height: 36,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                    offset: Offset(1, 3),
                    blurRadius: 9,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  
                  maxLength: 25,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    counterText: '',
                    hintText: 'Enter your email',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    border: InputBorder.none,
          
                    prefixIcon:
                        Image.asset('assets/images/mail.png', width: 24),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                    offset: Offset(1, 3),
                    blurRadius: 9,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLength: 25,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Image.asset(
                      'assets/images/lock.png',
                      width: 24,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      iconSize: 25,
                      
                    ),
                    counterText: '',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          InkWell(
            onTap: () {
              // Handle Facebook login
            },
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
                  colors: [
                    Color(0xFF59A7A7),
                    Color(0xFFAFCD6D)
                  ], // Set your gradient colors
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
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
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
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Row(
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
        ],
      ),
    );
  }
}
