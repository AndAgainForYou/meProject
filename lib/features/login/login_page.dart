import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  bool _isErrorVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextStyle errorTextStyle = const TextStyle(
    color: Colors.red, // Set the color you prefer for error text
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardDismissOnTap(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Stack(children: [
                      Positioned.fill(
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 25.0),
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: 150,
                              height: 98,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 22.0, left: 8.0, right: 8.0),
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
                                  color:
                                      Colors.white, // Set your preferred color
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.09000000357627869),
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
                            padding: const EdgeInsets.only(
                                bottom: 22.0, left: 8.0, right: 8.0),
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
                                  color:
                                      Colors.white, // Set your preferred color
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.09000000357627869),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: _isErrorVisible
                                      ? Colors.red
                                      : Colors.transparent),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.09000000357627869),
                                  offset: Offset(1, 3),
                                  blurRadius: 9,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              maxLength: 25,
                              decoration: InputDecoration(
                                counterText: '',
                                hintText: 'Enter your email',
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Gilroy',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                border: InputBorder.none,
                                prefixIcon: Image.asset(
                                    'assets/images/mail.png',
                                    width: 20),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  setState(() {
                                    _isErrorVisible = true;
                                  });
                                }
                                // Add more validation logic if needed
                                return null;
                              },
                            ),
                          ),
                        ),
                        if (_isErrorVisible)
                          const Padding(
                            padding: EdgeInsets.only(top: 4.0, left: 35),
                            child: Text(
                              'Invalid login',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        SizedBox(height: _isErrorVisible ? 4 : 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: _isErrorVisible
                                      ? Colors.red
                                      : Colors.transparent),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.09000000357627869),
                                  offset: Offset(1, 3),
                                  blurRadius: 9,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              maxLength: 25,
                              obscureText: _isObscure,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  setState(() {
                                    _isErrorVisible = true;
                                  });
                                }
                                // Add more validation logic if needed
                                return null;
                              },
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
                                  width: 20,
                                ),
                                counterText: '',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                  iconSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (_isErrorVisible)
                          const Padding(
                            padding: EdgeInsets.only(top: 4.0, left: 35),
                            child: Text(
                              'Invalid password',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: _isErrorVisible ? 4 : 24),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with login logic
                      }
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
                  const SizedBox(height: 16),
                  KeyboardVisibilityBuilder(builder: (context, visible) {
                    return Column(
                      children: <Widget>[
                        Visibility(
                          visible: !visible,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/RestorePasswordPage'),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                'Forgot my password',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.transparent,
                                  fontFamily: 'Gilroy',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                  decoration: TextDecoration.combine([
                                    TextDecoration.underline,
                                  ]),
                                  decorationColor:
                                      const Color.fromRGBO(89, 167, 167, 1),
                                  decorationThickness: 1.0,
                                  decorationStyle: TextDecorationStyle.solid,
                                  shadows: const [
                                    Shadow(
                                        color: Color.fromRGBO(89, 167, 167, 1),
                                        offset: Offset(0, -5))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !visible,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Directionality(
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
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(context, '/signUp'),
                                  child: const Directionality(
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
