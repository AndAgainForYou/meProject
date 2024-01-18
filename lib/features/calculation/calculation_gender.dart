import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateGenderWidget extends StatefulWidget {
  const CalculateGenderWidget({Key? key}) : super(key: key);

  @override
  _CalculateGenderWidgetState createState() => _CalculateGenderWidgetState();
}

class _CalculateGenderWidgetState extends State<CalculateGenderWidget> {
  String selectedGender = '';
  bool get _isButtonActive => selectedGender.isNotEmpty;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
          'Please indicate your gender',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Text(
          selectedGender.isNotEmpty ? selectedGender : 'I am...',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.titleMedium?.copyWith(
            color: selectedGender.isNotEmpty ? Colors.black : Colors.grey,
          ),
        ),
        const SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildGenderOption(
                assetPath: 'assets/images/male.png',
                gender: 'Male',
                maincolor: Colors.blue),
            buildGenderOption(
                assetPath: 'assets/images/female.png',
                gender: 'Female',
                maincolor: Colors.pink),
            buildGenderOption(
                assetPath: 'assets/images/other.png',
                gender: 'Other',
                maincolor: Colors.orange),
          ],
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
            onPressed: _isButtonActive
                ? () {
                    CalculateGlobalWidget.of(context).pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGenderOption(
      {required String assetPath,
      required String gender,
      required MaterialColor maincolor}) {
    bool isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: maincolor,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    spreadRadius: 10.0,
                    blurRadius: 20.0,
                  ),
                ]
              : const [
                  BoxShadow(
                    color: Color.fromRGBO(35, 35, 35, 0.086),
                    offset: Offset(0, 0),
                    blurRadius: 20,
                  ),
                  BoxShadow(
                    color: Colors.white,
                  ),
                ],
        ),
        child: Center(
          child: ColorFiltered(
            colorFilter: isSelected || selectedGender.isEmpty
                ? const ColorFilter.mode(Colors.transparent, BlendMode.multiply)
                : const ColorFilter.mode(Colors.white, BlendMode.color),
            child: Image.asset(
              assetPath,
              width: 80,
              height: 80,
            ),
          ),
        ),
      ),
    );
  }
}
