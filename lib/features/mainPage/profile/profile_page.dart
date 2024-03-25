import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/login/login_page.dart';
import 'package:platy/features/mainPage/profile/profile_change_filled.dart';
import 'package:platy/features/mainPage/profile/profile_edit_page.dart';
import 'package:platy/features/pro_version/pro_version_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final storage = const FlutterSecureStorage();
  String? email;
  String? password;

  String? emailText;
  String? profileImage;
  String? name;

  ImageProvider? backgroundImage;
  String? customImageFile;
  XFile? imageFile;

  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(32),
  );

  final kGradientBoxDecoration = BoxDecoration(
    gradient:
        const LinearGradient(colors: [Color(0xFF59A7A7), Color(0xFFAFCD6D)]),
    border: Border.all(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(12),
  );

  final kGradientBoxDecorationLog = BoxDecoration(
    gradient: const LinearGradient(colors: [
      Color.fromRGBO(252, 108, 76, 1),
      Color.fromRGBO(252, 108, 76, 1)
    ]),
    border: Border.all(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(32),
  );

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PlatyBloc>(context).add(ProfileDataEvent({}));
    _loadCredentials();
    //profileData;
  }

  void _loadCredentials() async {
    password = await storage.read(key: 'password');
    setState(() {
      password = password;
    });
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo_small.png',
          height: 32,
          width: 32,
        ),
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      ),
      body: BlocBuilder<PlatyBloc, PlatyBlocState>(
        builder: (context, state) {
          if (state is ProfileIncludesDataState) {
            Map<String, dynamic> profileData = state.profilePageData;
            emailText = profileData['user_email'];
            profileImage = profileData['photo'];
            name = profileData['name'];
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Center(
                      child: Column(
                    children: [
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
                      const SizedBox(height: 8),
                      Text(
                        name.toString(),
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        emailText.toString(),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 6),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileEditPage()),
                              );
                            },
                            child: Container(
                                height: 44.0,
                                width: MediaQuery.of(context).size.width * 1,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                    bottomLeft: Radius.zero,
                                    bottomRight: Radius.zero,
                                  ),
                                  color: Colors.white,
                                ),
                                child: const Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.0, right: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Edit Profile",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileChangeFilledPage()),
                              );
                            },
                            child: Container(
                              height: 44.0,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.zero,
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                ),
                                color: Colors.white,
                              ),
                              child: const Padding(
                                padding:
                                    EdgeInsets.only(left: 16.0, right: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'My data',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Visibility(
                        visible: false,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 44.0,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero,
                              ),
                              color: Colors.white,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Notifications",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: false,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProVersionPage()),
                            );
                          },
                          child: Container(
                            height: 44.0,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.zero,
                                topRight: Radius.zero,
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                              ),
                              color: Colors.white,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Сhange my subscription plan",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showCupertinoAlertDialog(context,
                              email: emailText!, password: password.toString());
                        },
                        child: Container(
                          height: 44.0,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showCupertinoAlertDialog(BuildContext context,
      {required String email, required String password}) {
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);

    Map<String, dynamic> logOutData = {
      "email": email,
      "password": password,
    };
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Log out ?'),
          content:
              const Text('Are you sure you want to log out of your account?'),
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
              onPressed: () {
                platyBloc.add(LogOutEvent(logOutData));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginPage()));
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
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
