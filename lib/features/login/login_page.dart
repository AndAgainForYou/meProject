import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/mainPage/main_home_page.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email;
  String? _password;
  bool _isObscure = true;
  bool _isErrorVisible = false;
  bool _isErrorRequest = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _allFieldsFilled = false;

   // Define a FocusNode for the email text field
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextStyle errorTextStyle = const TextStyle(
    color: Colors.red, // Set the color you prefer for error text
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();

    // Add listener to the FocusNode
    _emailFocusNode.addListener(_onEmailFocusChange);
    _passwordFocusNode.addListener(_onPasswordFocusChange);
  }

   // Dispose the FocusNode when not needed
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }


   void _onEmailFocusChange() {
    setState(() {
      // Change the border color based on focus
      _isErrorRequest = false;
    });
  }

  void _onPasswordFocusChange() {
    setState(() {
      // Change the border color based on focus
      _isErrorRequest = false;
    });
  }

  void _updateButtonState() {
  setState(() {
    _allFieldsFilled = _email != null &&
        _email!.isNotEmpty &&
        _password != null &&
        _password!.isNotEmpty;
  });
}

  @override
  Widget build(BuildContext context) {
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
    Map<String, dynamic> loginData = {
      "email": _email,
      "password": _password.toString(),
    };

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocListener<PlatyBloc, PlatyBlocState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              setState(() {
                _isErrorVisible = true;
                _isErrorRequest = false;
              });
            }
            ;
            if (state is LoginSuccessState) {
              platyBloc.add(ProfileDataEvent({}));
            }
            ;
            if (state is ProfileNotIncludesDataState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalculateGlobalWidget()));
            } else if (state is ProfileIncludesDataState) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const MainHomePage()));
            }
          },
          child: KeyboardDismissOnTap(
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverFillRemaining(
                  child: Stack(
                    children: [Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Stack(children: [
                            Positioned.fill(
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child: Image.asset(
                                        'assets/images/logo_small.png',
                                        width: 64,
                                        height: 90,
                                      ),
                                    ),
                                    const Text(
                                      'Welcome back',
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Montserrat',
                                          height: 0.99),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 30),


                                    Visibility(
                                      visible: Platform.isIOS,
                                      child: GestureDetector(
                                        onTap: () async {
                                          try {
                                           platyBloc.add(LogInWithAppleEvent());
                                           
                                            // You can use the result to authenticate the user with your server.
                                          } catch (error) {
                                            print(error.toString());
                                          }
                                        },
                                        child: Container(
                                            constraints: BoxConstraints(
                                              maxHeight: 52,
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.92,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              gradient: const LinearGradient(
                                                begin: Alignment(0.0, -1.0),
                                                end: Alignment(1.0, 1.0),
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.transparent
                                                ],
                                                stops: [0.0, 1.0],
                                              ),
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: GestureDetector(
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/apple_logo.png',
                                                        width: 20,
                                                        height: 23,
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      const Text(
                                                        'Continue with Apple',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 16,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                               
                                              ),
                                            ),
                                      ),
                                    ),


                                    const SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {
                                        platyBloc.add(LogInWithGoogleEvent());
                                      },
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxHeight: 52,
                                          maxWidth:
                                              MediaQuery.of(context).size.width *
                                                  0.92,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          gradient: const LinearGradient(
                                            begin: Alignment(0.0, -1.0),
                                            end: Alignment(1.0, 1.0),
                                            colors: [
                                              Colors.transparent,
                                              Colors.transparent
                                            ],
                                            stops: [0.0, 1.0],
                                          ),
                                          border: Border.all(color: Colors.grey),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/google.png',
                                                width: 40,
                                                height: 43,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                'Continue with Google',
                                                style: TextStyle(
                                                  color: Colors.black,
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
                              ),
                            ),
                          ]),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: _isErrorVisible
                                          ? Colors.red
                                          : _emailFocusNode.hasFocus
                                              ? Colors.black
                                              : Colors.transparent,),
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
                                    focusNode: _emailFocusNode,
                                    onChanged: (value) {
                                      setState(() {
                                        _email = value;
                                        _isErrorVisible =
                                            false; // Reset error visibility
                                            _updateButtonState();
                                      });
                                    },
                                    maxLength: 25,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      counterText: '',
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Gilroy',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      border: InputBorder.none,
                                      focusColor: Colors.black, // Add this line
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
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: _isErrorVisible
                                          ? Colors.red
                                          : _passwordFocusNode.hasFocus
                                              ? Colors.black
                                              : Colors.transparent,),
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
                                    focusNode: _passwordFocusNode,
                                    onChanged: (value) {
                                      setState(() {
                                        _password = value;
                                        _isErrorVisible =
                                            false; // Reset error visibility
                                            _updateButtonState();
                                      });
                                    },
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
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, top: 10.0),
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Gilroy',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      border: InputBorder.none,
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
                                    'Invalid account data',
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
                        KeyboardVisibilityBuilder(builder: (context, visible) {
                          return Column(
                            children: <Widget>[
                              Visibility(
                                visible: !visible,
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, '/RestorePasswordPage'),
                                  child: const Padding(
                                    padding: EdgeInsets.only(bottom: 16.0),
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
                                        shadows: [
                                          Shadow(
                                              color: Color.fromRGBO(
                                                  255, 163, 132, 1),
                                              offset: Offset(0, -5))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (_isErrorVisible != true) {
                                platyBloc.add(LogInEvent(loginData));
                              }
                              ;
                            }
                          },
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 52,
                              maxWidth: MediaQuery.of(context).size.width * 0.92,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              gradient: LinearGradient(
                                begin: const Alignment(0.0, -1.0),
                                end: const Alignment(1.0, 1.0),
                                colors: [
                                  
                                  _allFieldsFilled ? const Color.fromRGBO(164, 171, 155, 1) : const Color.fromRGBO(205, 201, 196, 1),
                                  _allFieldsFilled ? const Color.fromRGBO(164, 171, 155, 1) : const Color.fromRGBO(205, 201, 196, 1)
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
                        const SizedBox(height: 30),
                        KeyboardVisibilityBuilder(builder: (context, visible) {
                          return Column(
                            children: <Widget>[
                              Visibility(
                                visible: !visible,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Text(
                                          'Don`t have an account ?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Gilroy',
                                              fontSize: 12,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      GestureDetector(
                                        onTap: () => Navigator.pop(
                                            context),
                                        child: const Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Text(
                                            'Sign Up',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                      255, 163, 132, 1),
                                                fontFamily: 'Gilroy',
                                                fontSize: 16,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 28),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                     KeyboardVisibilityBuilder(builder: (context, visible) {
                      return Visibility(
                        visible: !visible,
                        child: const Positioned.fill(
                          child: Center(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 50.0, left: 90.0, right: 90.0),
                                child: Row(children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Divider(
                                      color:
                                          Color.fromRGBO(205, 201, 196, 0.882),
                                    ),
                                  )),
                                  Text(
                                    "Or",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(0, 0, 0, 0.5)),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Divider(
                                      color:
                                          Color.fromRGBO(205, 201, 196, 0.882),
                                    ),
                                  )),
                                ])),
                          ),
                        ),
                      );
                    }),
                    ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
