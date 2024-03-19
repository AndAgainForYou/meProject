import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';
import 'package:wheel_slider/wheel_slider.dart';

class ProfileHeightWidget extends StatefulWidget {
  const ProfileHeightWidget({Key? key}) : super(key: key);

  @override
  _ProfileHeightWidgetState createState() => _ProfileHeightWidgetState();
}

class _ProfileHeightWidgetState extends State<ProfileHeightWidget> {
  bool _switchValue = true;
  TextEditingController _cmController = TextEditingController();
  TextEditingController _ftController = TextEditingController();
  TextEditingController _inController = TextEditingController();
  Map<String, dynamic> updateProfileData = {};
  void isActive() {
    if (_switchValue) {
      if (_cmController.text.isNotEmpty) {
        updateProfileData['height'] = "${_cmController.text}cm";
      } else {}
    } else {
      if (_ftController.text.isNotEmpty && _inController.text.isNotEmpty) {
        updateProfileData['height'] =
            "${_ftController.text}ft ${_inController.text}in";
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        leading: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: IconButton(
            icon: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        toolbarHeight: 90,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: Image.asset(
          'assets/images/logo_small.png',
          width: 32,
          height: 32,
        ),
      ),
      body: BlocListener<PlatyBloc, PlatyBlocState>(
        listener: (context, state) {
          if (state is ProfileIncludesDataState) {
            Navigator.of(context).pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'How tall are you?',
                      textAlign: TextAlign.center,
                      style: whiteTheme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  width: 112,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(230, 227, 223, 1)),
                    color: const Color.fromRGBO(205, 201, 196, 0.24),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _switchValue = true;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 55,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: _switchValue
                                ? const Color.fromRGBO(196, 203, 185, 1)
                                : Colors.transparent,
                          ),
                          child: const Text(
                            'cm',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _switchValue = false;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 55,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: !_switchValue
                                ? const Color.fromRGBO(196, 203, 185, 1)
                                : Colors.transparent,
                          ),
                          child: const Text(
                            'ft',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    if (_switchValue)
                      Container(
                        width: 160.0,
                        height: 52.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: const Color.fromRGBO(230, 227, 223, 1),
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.orange,
                            controller: _cmController,
                            textAlign: TextAlign.start,
                            style: whiteTheme.textTheme.titleMedium
                                ?.copyWith(color: Colors.black),
                            obscureText: false,
                            onChanged: (text) {
                              isActive();
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'cm',
                              hintStyle: whiteTheme.textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                    if (!_switchValue)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 90.0,
                            height: 52.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: const Color.fromRGBO(230, 227, 223, 1),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.orange,
                                controller: _ftController,
                                textAlign: TextAlign.start,
                                style: whiteTheme.textTheme.titleMedium
                                    ?.copyWith(color: Colors.black),
                                obscureText: false,
                                onChanged: (text) {
                                  isActive();
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'ft',
                                  hintStyle: whiteTheme.textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 90.0,
                            height: 52.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: const Color.fromRGBO(230, 227, 223, 1),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.orange,
                                controller: _inController,
                                textAlign: TextAlign.start,
                                style: whiteTheme.textTheme.titleMedium
                                    ?.copyWith(color: Colors.black),
                                obscureText: false,
                                onChanged: (text) {
                                  isActive();
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'in',
                                  hintStyle: whiteTheme.textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 54.0,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(164, 171, 155, 1),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<PlatyBloc>(context)
                          .add(UpdateProfilePatchEvent(updateProfileData));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
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
