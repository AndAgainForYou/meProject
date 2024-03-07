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
  String _heightController = '';
  final int _nTotalCount = 240;
  final int _nInitValue = 170;
  int _nCurrentValue = 170;

  Map<String, dynamic> updateProfileData = {};

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
                SizedBox(width: 8),
                Text('Back'),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Image.asset('assets/images/logo_small.png'),
      ),
      body: BlocListener<PlatyBloc, PlatyBlocState>(
        listener: (context, state) {
          if (state is ProfileIncludesDataState) {
            Navigator.of(context).pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'What is your height?',
                    textAlign: TextAlign.center,
                    style: whiteTheme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: _heightController.isEmpty ? '...' : '',
                            style: whiteTheme.textTheme.titleMedium!
                                .copyWith(color: Colors.black)),
                        TextSpan(
                          text: _heightController,
                          style: whiteTheme.textTheme.titleMedium!
                              .copyWith(color: Colors.black),
                        ),
                        TextSpan(
                            text: '/',
                            style: whiteTheme.textTheme.titleMedium!
                                .copyWith(color: Colors.black)),
                        TextSpan(
                          text: 'cm',
                          style: whiteTheme.textTheme.titleMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    'Height',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 1),
                width: MediaQuery.of(context).size.width * 1,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(35, 35, 35, 0.2),
                      offset: Offset(0, 3),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.white,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(252, 108, 76, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: WheelSlider.number(
                        perspective: 0.0001,
                        totalCount: _nTotalCount,
                        initValue: _nInitValue,
                        animationDuration: const Duration(milliseconds: 600),
                        selectedNumberStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        unSelectedNumberStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        currentIndex: _nCurrentValue,
                        onValueChanged: (val) {
                          setState(() {
                            _nCurrentValue = val;
                            _heightController = val.toString();
                            updateProfileData['height'] = val;
                          });
                        },
                        hapticFeedbackType: HapticFeedbackType.heavyImpact,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 54.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF59A7A7),
                      Color(0xFFAFCD6D),
                    ],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    platyBloc.add(UpdateProfilePatchEvent(updateProfileData));
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
    );
  }
}
