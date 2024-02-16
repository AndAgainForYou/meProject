import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platy/features/mainPage/profile/profile_change_filled.dart';
import 'package:platy/features/mainPage/profile/profile_edit_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    borderRadius: BorderRadius.circular(32),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(
                  child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        AssetImage('assets/images/profile_photo.png'),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Steve Jobs',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'stevejobs@mail.com',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 6),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              height: 52.0,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: kGradientBoxDecoration,
                              child: Container(
                                decoration: kInnerDecoration,
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 6.0),
                                      child: Image.asset(
                                        'assets/images/profile_edit_vector.png',
                                        height: 24,
                                      ),
                                    ),
                                    const Text(
                                      "Edit Profile",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
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
                              child: const Center(
                                child: Text(
                                  'Recalculation of values',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Gilroy',
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
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
                          height: 52.0,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: kGradientBoxDecoration,
                          child: Container(
                            decoration: kInnerDecoration,
                            child: const Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Сhange my subscription plan",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(height: 130),
                      GestureDetector(
                        onTap: () {
                          _showCupertinoAlertDialog(context);
                        },
                        child: Container(
                          height: 52.0,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: kGradientBoxDecorationLog,
                          child: Container(
                            decoration: kInnerDecoration,
                            child: const Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Log Out",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          _showCupertinoAlertDialogDelete(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 52.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            gradient: const LinearGradient(
                              begin: Alignment(0.0, -1.0),
                              end: Alignment(1.0, 1.0),
                              colors: [
                                Color.fromRGBO(252, 108, 76, 1),
                                Color.fromRGBO(252, 108, 76, 1)
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
                              'Delete account',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Gilroy',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  void _showCupertinoAlertDialog(BuildContext context) {
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
                Navigator.pop(context);
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }

  void _showCupertinoAlertDialogDelete(BuildContext context) {
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
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
