import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/restore_password/restore_password_success_page.dart';

class RestorePasswordPage extends StatefulWidget {
  const RestorePasswordPage({super.key});

  @override
  State<RestorePasswordPage> createState() => _RestorePasswordPageState();
}

class _RestorePasswordPageState extends State<RestorePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  String? _email;
  bool _isEmailSend = false;
  bool _isEmailValid = false;
  bool _isErrorRestore = false;

  // Define a FocusNode for the email text field
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _isEmailSend = false;
    _isEmailValid = false;
    _isErrorRestore = false;

    // Add listener to the FocusNode
    _emailFocusNode.addListener(_onEmailFocusChange);
  }

  @override
  void dispose() {
    // Dispose the FocusNode when not needed
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _onEmailFocusChange() {
    setState(() {
      // Change the border color based on focus
      _isErrorRestore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
    Map<String, dynamic> resetData = {
      "email": _email,
    };
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: BlocListener<PlatyBloc, PlatyBlocState>(
        listener: (context, state) {
          if (state is PasswordResetErrorState) {
            setState(() {
              _isEmailValid = false;
              _isErrorRestore = true;
            });
          }
          ;
          if (state is PasswordResetSuccessState) {
             Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const RestorePasswordSuccessPage()));
          }
          ;
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_simple.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: KeyboardDismissOnTap(
            child: Padding(
              padding: const EdgeInsets.only(top: 122.0),
              child: Column(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 0.0, right: 25.0),
                      child: Center(
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
                              TextSpan(
                                  text: 'Restore password'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 14.0, left: 30.0, right: 30.0),
                      child: Text(
                        "Enter your email address and we'll send you a new recovery password",
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
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                            border: Border.all(
                              color: _emailFocusNode.hasFocus
                                  ? Colors
                                      .black // Change the border color when the email field has focus
                                  : _isErrorRestore
                                      ? Colors
                                          .red // Change the border color when there's an error
                                      : Colors.transparent,
                            ),
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
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              counterText: '',
                              hintText: 'Enter your email',
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
                                _isEmailValid = value.isNotEmpty;
                                _isErrorRestore = false;
                              });
                            },
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                          ),
                        ),
                      ),
                    ),
                    if (_isErrorRestore)
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Email doesn`t exist',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: _isErrorRestore ? 6 : 26),
                    Center(
                      child: Column(
                        children: [
                          Visibility(
                            visible: !_isEmailSend,
                            child: GestureDetector(
                              onTap: () {
                                if (_isEmailValid) {
                                  platyBloc.add(PasswordResetEvent(resetData));
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
                                      _isEmailValid
                                          ? const Color.fromRGBO(
                                              164, 171, 155, 1)
                                          : const Color.fromRGBO(
                                              205, 201, 196, 1),
                                      _isEmailValid
                                          ? const Color.fromRGBO(
                                              164, 171, 155, 1)
                                          : const Color.fromRGBO(
                                              205, 201, 196, 1),
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Send',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
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
          ),
        ),
      ),
    );
  }
}
