import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class RestorePasswordPage extends StatefulWidget {
  const RestorePasswordPage({super.key});

  @override
  State<RestorePasswordPage> createState() => _RestorePasswordPageState();
}

class _RestorePasswordPageState extends State<RestorePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  bool _isEmailSend = false;
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();

    _isEmailSend = false;
    _isEmailValid = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardDismissOnTap(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 180,
                          height: 170,
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 0.0, right: 25.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 32,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: !_isEmailSend
                                ? 'Let us help you'
                                : 'A new password  has been sent to you',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 65.0, right: 65.0),
                    child: Text(
                      !_isEmailSend
                          ? "Restore password"
                          : 'Follow the instructions in the email and try logging in again',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
              child: Stack(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KeyboardVisibilityBuilder(builder: (context, visible) {
                      return Visibility(
                          visible: !visible,
                          child: !_isEmailSend
                              ? Image.asset(
                                  'assets/images/restore.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/restore_complete.png'));
                    }),

                    //!_isEmailSend ? Image.asset('assets/images/restore.png', fit: BoxFit.cover,) : Image.asset('assets/images/restore_complete.png'),

                    KeyboardVisibilityBuilder(
                      builder: (context, visible) {
                        return Padding(
                          padding:
                              EdgeInsets.only(bottom: !visible ? 90.0 : 10.0),
                          child: Column(
                            children: [
                              Visibility(
                                visible: !_isEmailSend,
                                child: Form(
                                  key: _formKey,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
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
                                              'assets/images/user.png',
                                              width: 20),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _isEmailValid = value.isNotEmpty;
                                          });
                                        },
                                        controller: _emailController,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Center(
                                child: Column(
                                  children: [
                                    Visibility(
                                      visible: !_isEmailSend,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (_isEmailValid) {
                                            setState(() {
                                              _isEmailSend = true;
                                            });
                                          }
                                        },
                                        child: Container(
                                          constraints: const BoxConstraints(
                                            maxHeight: 52,
                                            maxWidth: 335,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            gradient: const LinearGradient(
                                              begin: Alignment(0.0, -1.0),
                                              end: Alignment(1.0, 1.0),
                                              colors: [
                                                Color(0xFF59A7A7),
                                                Color(0xFFAFCD6D)
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
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  !_isEmailSend
                                                      ? 'Restore Password'
                                                      : 'To Log In',
                                                  style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 16,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: _isEmailSend,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          print('go to login...');
                                        },
                                        child: Container(
                                          constraints: const BoxConstraints(
                                            maxHeight: 52,
                                            maxWidth: 335,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            gradient: const LinearGradient(
                                              begin: Alignment(0.0, -1.0),
                                              end: Alignment(1.0, 1.0),
                                              colors: [
                                                Color(0xFF59A7A7),
                                                Color(0xFFAFCD6D)
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
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  !_isEmailSend
                                                      ? 'Restore Password'
                                                      : 'To Log In',
                                                  style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 16,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
