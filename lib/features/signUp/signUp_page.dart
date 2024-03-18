import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/login/login_page.dart';
import 'package:platy/features/signUp/signUp_confirm_page.dart';
import 'package:platy/features/signUp/signUp_congratulation_page.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'dart:io' show Platform;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _email;
  String? _password1;
  String? _password2;
  bool _isObscure = true;
  bool _isFieldsEmpty = true;
  bool _isErrorRequest = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Define a FocusNode for the email text field
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isPasswordsEqual = true;

  bool _isPasswordLess1 = false;
  bool _isPasswordLess2 = false;

  @override
  void initState() {
    super.initState();

    _isFieldsEmpty = true;
    _isErrorRequest = false;

    _isEmailValid = false;
    _isPasswordValid = false;
    _isPasswordsEqual = true;

    _isPasswordLess1 = false;
    _isPasswordLess2 = false;
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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _updateButtonState() {
    setState(() {
      // Enable the button only if all three fields are non-empty
      _isFieldsEmpty = !_isEmailValid ||
          !_isPasswordValid ||
          !_isPasswordMeetsRequirements();
    });
  }

  final TextStyle errorTextStyle = const TextStyle(
    color: Colors.red, // Set the color you prefer for error text
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

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

  bool _isPasswordMeetsRequirements() {
    // Check if password length is at least 8 characters
    bool hasMinimumLength = _password1 != null && _password1!.length >= 8;
    // Check if password contains at least one uppercase letter
    bool hasUppercaseLetter =
        _password1 != null && _password1!.contains(RegExp(r'[A-Z]'));
    // Check if password contains at least one lowercase letter
    bool hasLowercaseLetter =
        _password1 != null && _password1!.contains(RegExp(r'[a-z]'));
    // Check if password contains at least one digit
    bool hasDigit =
        _password1 != null && _password1!.contains(RegExp(r'[0-9]'));

    // Return true if all requirements are met
    return hasMinimumLength &&
        hasUppercaseLetter &&
        hasLowercaseLetter &&
        hasDigit;
  }

// Function to check if the email is in a valid format
  bool _isValidEmail(String email) {
    // Regular expression for email validation
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
    Map<String, dynamic> signUpData = {
      "email": _email,
      "password1": _password1.toString(),
      "password2": _password1.toString(),
    };

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_signUp.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocListener<PlatyBloc, PlatyBlocState>(
          listener: (context, state) {
            if (state is SignUpErrorState) {
              setState(() {
                _isPasswordsEqual = false;
                _isErrorRequest = true;
              });
            }
            ;
            if (state is SignUpSuccessState) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const SignUpConfirmPage()));
            }
            ;
          },
          child: KeyboardDismissOnTap(
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverFillRemaining(
                  child: Stack(children: [
                    Column(
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
                                        width: 150,
                                        height: 98,
                                      ),
                                    ),
                                    const Text(
                                      'Create new \nAccount',
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Montserrat',
                                          height: 0.99),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 30),

                                    //Platform.isIOS

                                   Visibility(
                                      visible: Platform.isIOS,
                                      child: GestureDetector(
                                        onTap: () async {
                                          try {
                                            final result = await SignInWithApple
                                                .getAppleIDCredential(
                                              scopes: [
                                                AppleIDAuthorizationScopes
                                                    .email,
                                                AppleIDAuthorizationScopes
                                                    .fullName,
                                              ],
                                              webAuthenticationOptions:
                                                  WebAuthenticationOptions(
                                                clientId: '98WRF4D97U',
                                                redirectUri: Uri.parse(
                                                    'https://test.com/auth/login'),
                                              ),
                                            );

                                            print(result);
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
                                          border:
                                              Border.all(color: Colors.grey),
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
                                      color: _isErrorRequest
                                          ? Colors.red
                                          : _emailFocusNode.hasFocus
                                              ? Colors.black
                                              : Colors.transparent,
                                    ),
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
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _email = value;
                                        _isEmailValid = _isValidEmail(
                                            value); // Update email validation state
                                        _isErrorRequest = false;
                                        _updateButtonState(); // Call the method here to update the button state
                                      });
                                      _updateButtonState();
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        setState(() {
                                          _isFieldsEmpty = true;
                                        });
                                      } else if (!_isValidEmail(value)) {
                                        setState(() {
                                          _isEmailValid = false;
                                        });
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                    controller: _emailController,
                                  ),
                                ),
                              ),
                              if (_isErrorRequest)
                                const Padding(
                                  padding: EdgeInsets.only(top: 4.0, left: 35),
                                  child: Text(
                                    'Please enter a valid email address',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              SizedBox(height: _isErrorRequest ? 10 : 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(
                                      color: _isErrorRequest
                                          ? Colors.red
                                          : _passwordFocusNode.hasFocus
                                              ? Colors.black
                                              : Colors.transparent,
                                    ),
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
                                    maxLength: 25,
                                    obscureText: _isObscure,
                                    onChanged: (value) {
                                      setState(() {
                                        _password1 = value;
                                        _isPasswordsEqual = true;
                                        _isPasswordValid = value.isNotEmpty;
                                        _updateButtonState(); // Call the method here to update the button state
                                      });
                                      _updateButtonState();
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        setState(() {
                                          _isFieldsEmpty = true;
                                        });
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, top: 10),
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
                                    controller: _passwordController,
                                  ),
                                ),
                              ),
                              KeyboardVisibilityBuilder(
                                  builder: (context, visible) {
                                return Visibility(
                                  visible: !visible,
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 4.0, left: 15, right: 15),
                                    child: Text(
                                      'The password must be at least 8 characters long and contain an uppercase letter, a lowercase letter, and a number',
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            if (_isFieldsEmpty) {
                              if (_formKey.currentState?.validate() ?? false) {}
                            } else {
                              if (_isPasswordsEqual) {
                                platyBloc.add(SignUpEvent(signUpData));
                              }
                            }
                          },
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 52,
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.92,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              gradient: LinearGradient(
                                begin: const Alignment(0.0, -1.0),
                                end: const Alignment(1.0, 1.0),
                                colors: [
                                  _isFieldsEmpty
                                      ? const Color.fromRGBO(205, 201, 196, 1)
                                      : const Color.fromRGBO(164, 171, 155, 1),
                                  _isFieldsEmpty
                                      ? const Color.fromRGBO(205, 201, 196, 1)
                                      : const Color.fromRGBO(164, 171, 155, 1),
                                ],
                                stops: const [0.0, 1.0],
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
                                'Sign Up',
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
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Text(
                                          'Already have an account?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Gilroy',
                                              fontSize: 12,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () => {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage(),
                                            ),
                                          )
                                        },
                                        child: const Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Text(
                                            'Log in',
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
                                      const SizedBox(height: 40),
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
                                    top: 100.0, left: 90.0, right: 90.0),
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
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
