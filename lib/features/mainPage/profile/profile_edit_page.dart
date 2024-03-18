import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/login/login_page.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final storage = const FlutterSecureStorage();
  String? email;
  String? password;
  String? profileImage;

  ImageProvider? backgroundImage;
  String? customImageFile;
  XFile? imageFile;

  bool _isObscure = true;

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

  Future openGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      print('Image URI: ${imageFile!.path}');
      PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
      platyBloc.add(ProfileImagePostEvent(imageFile!));
    } else {
      print('User didn\'t pick an image');
    }
  }

  @override
  Widget build(BuildContext context) {
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
          title: Image.asset(
            'assets/images/logo_small.png',
            width: 32,
            height: 32,
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                if (formData.isNotEmpty) {
                  platyBloc.add(UpdateProfilePatchEvent(formData));
                  platyBloc.add(UpdateProfileGetEvent({}));

                  await Future.delayed(const Duration(seconds: 1));
                }
                ;
                Navigator.pop(context);
                if (isPasswordsDataValid()) {
                  if (areNewPasswordsEqual) {
                    platyBloc.add(PasswordChangePatchEvent(passwordsData));
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
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'Edit',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
          backgroundColor: const Color.fromARGB(255, 240, 242, 236),
          elevation: 0.0,
          scrolledUnderElevation: 0),
      body: BlocBuilder<PlatyBloc, PlatyBlocState>(
        builder: (context, state) {
          if (state is ProfileIncludesDataState) {
            Map<String, dynamic> profileData = state.profilePageData;

            profileImage = profileData['photo'];
          }

          if (state is ProfileIncludesDataState) {
            Map<String, dynamic> profileData = state.profilePageData;
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Edit account',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // openGallery(); // This is where you handle the tap event
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 60,
                      backgroundImage: profileImage != null
                          ? NetworkImage(
                              profileImage as String,
                            ) as ImageProvider<Object>?
                          : const AssetImage(
                              'assets/images/user-logo-image.png',
                            ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  GestureDetector(
                    onTap: () {
                      openGallery();
                    },
                    child: const Text(
                      'Set New Photo',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.915,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
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
                                      const EdgeInsets.only(left: 20),
                                  counterText: '',
                                  hintText: profileData['name'],
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Gilroy',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
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
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              counterText: '',
                              hintText: 'Your email',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Gilroy',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                            ),
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
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
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
                            obscureText: _isObscure,
                            controller: _controllerPassword,
                            enabled: true,
                            maxLength: 25,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 20, top: 10),
                              counterText: '',
                              hintText: 'Your Password',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Gilroy',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
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
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(color: Colors.grey),
                            onChanged: (value) {
                              if (value.length >= 8) {
                                setPasswordFieldValue('new_password1', value);
                                setPasswordFieldValue('new_password2', value);
                              } else {
                                print('too small password');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      _showCupertinoAlertDialogDelete(context,
                          email: email, password: password);
                    },
                    child: const Text(
                      'Delete account',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(255, 59, 48, 1)),
                    ),
                  )
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

  void _showCupertinoAlertDialogDelete(BuildContext context,
      {required email, String? password}) {
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Delete account ?'),
          content: const Text('Are you sure you want to delete your account?'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginPage()));
                await Future.delayed(const Duration(seconds: 1));
                platyBloc.add(DeleteAccountEvent(const {}));
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
