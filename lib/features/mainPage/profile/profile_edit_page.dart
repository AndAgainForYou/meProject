import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final storage = FlutterSecureStorage();
  String? email;
  String? password;

  TextEditingController _controllerFirstName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerNewPassword = TextEditingController();
  TextEditingController _controllerRepeatNewPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  void _loadCredentials() async {
    email = await storage.read(key: 'email');
    password = await storage.read(key: 'password');
    setState(() {
      _controllerEmail.text = email ?? '';
      _controllerPassword.text = password ?? '';
      passwordsData["old_password"] = password;
    });
    print(_controllerEmail.text);
  }

  Map<String, dynamic> formData = {};
  Map<String, dynamic> passwordsData = {};
  bool areNewPasswordsEqual = true;

  void setFormFieldValue(String key, String value) {
    if (value.isNotEmpty) {
      setState(() {
        formData[key] = value;
      });
    } else if (formData.containsKey(key)) {
      setState(() {
        formData.remove(key);
      });
    }
  }

  void setPasswordFieldValue(String key, String value) {
    if (value.isNotEmpty) {
      setState(() {
        passwordsData[key] = value;
      });
    } else if (passwordsData.containsKey(key)) {
      setState(() {
        passwordsData.remove(key);
      });
    }
    areNewPasswordsEqual =
        passwordsData['new_password1'] == passwordsData['new_password2'];
  }

  bool isFormDataValid() {
    List<String> requiredFields = [
      'name',
    ];
    return requiredFields.every(
        (field) => formData[field] != null && formData[field].isNotEmpty);
  }

  bool isPasswordsDataValid() {
    List<String> requiredFields = [
      'old_password',
      'new_password1',
      'new_password2',
    ];

    return requiredFields.every((field) =>
        passwordsData[field] != null &&
        passwordsData[field].isNotEmpty &&
        passwordsData[field].length >= 8);
  }

  @override
  Widget build(BuildContext context) {
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: IconButton(
            icon: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Back')
                ]),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Edit Account',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Gilroy',
          ),
        ),
      ),
      body: BlocBuilder<PlatyBloc, PlatyBlocState>(
        builder: (context, state) {
          if (state is ProfileIncludesDataState) {
            Map<String, dynamic> profileData = state.profilePageData;
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'USER NAME',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(color: Colors.transparent),
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
                                controller: _controllerFirstName,
                                maxLength: 25,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 16),
                                  counterText: '',
                                  hintText: profileData['name'],
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setFormFieldValue(
                                      'name', value); //need change
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'EMAIL',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(color: Colors.transparent),
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
                            controller: _controllerEmail,
                            enabled: false,
                            maxLength: 25,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Your email',
                              hintStyle: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Gilroy',
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              prefixIcon: Image.asset('assets/images/mail.png',
                                  width: 20),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(color: Colors.black),
                            onChanged: (value) {
                              // setFormFieldValue('email', value);  //email dont need to change only show
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PASSWORD',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(color: Colors.transparent),
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
                            obscureText: true,
                            controller: _controllerPassword,
                            enabled: false,
                            maxLength: 25,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Your Password',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Gilroy',
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              prefixIcon: Image.asset('assets/images/key.png',
                                  width: 20),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(color: Colors.black),
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'NEW PASSWORD',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: !areNewPasswordsEqual
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
                            obscureText: true,
                            controller: _controllerNewPassword,
                            maxLength: 25,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Enter new Password',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Gilroy',
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              prefixIcon: Image.asset('assets/images/key.png',
                                  width: 20),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              setPasswordFieldValue(
                                  'new_password1', value); //need change
                            },
                          ),
                        ),
                        if (!areNewPasswordsEqual)
                          const Padding(
                            padding: EdgeInsets.only(top: 0.0, left: 16),
                            child: Text(
                              'Passwords is on equal or less than 8 letters',
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
                  SizedBox(height: !areNewPasswordsEqual ? 0 : 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'REPEAT NEW PASSWORD',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: !areNewPasswordsEqual
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
                            obscureText: true,
                            controller: _controllerRepeatNewPassword,
                            maxLength: 25,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Repeat new Password',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Gilroy',
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              prefixIcon: Image.asset('assets/images/key.png',
                                  width: 20),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              setPasswordFieldValue('new_password2', value);

                              //need change
                            },
                          ),
                        ),
                        if (!areNewPasswordsEqual)
                          const Padding(
                            padding: EdgeInsets.only(top: 1.0, left: 16),
                            child: Text(
                              'Passwords is on equal or less than 8 letters',
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
                  SizedBox(height: !areNewPasswordsEqual ? 121 : 140),
                  GestureDetector(
                    onTap: () async {
                      if (formData.isNotEmpty) {
                        platyBloc.add(UpdateProfilePatchEvent(formData));
                        platyBloc.add(UpdateProfileGetEvent({}));

                        await Future.delayed(const Duration(seconds: 1));

                        Navigator.pop(context);
                      }
                      ;
                      if (isPasswordsDataValid()) {
                        if (areNewPasswordsEqual) {
                          platyBloc
                              .add(PasswordChangePatchEvent(passwordsData));
                          Navigator.pop(context);
                        } else {
                          setState(() {
                            areNewPasswordsEqual = false;
                          });
                        }
                      } else {
                        setState(() {
                          areNewPasswordsEqual = false;
                        });
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 52.0,
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
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
          } else {
            return const Text('');
          }
        },
      ),
    );
  }
}
