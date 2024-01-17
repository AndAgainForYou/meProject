import 'package:flutter/material.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateGenderWidget extends StatefulWidget {
  const CalculateGenderWidget({Key? key}) : super(key: key);

  @override
  _CalculateGenderWidgetState createState() => _CalculateGenderWidgetState();
}

class _CalculateGenderWidgetState extends State<CalculateGenderWidget> {
  String selectedGender = ''; // Зберігає вибраний гендер
  bool get _isButtonActive => selectedGender.isNotEmpty;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Обробник натискання кнопки назад
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: const Image(
          image: AssetImage('assets/images/logo_small.png'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Questions:',
                    textAlign: TextAlign.left,
                    style: whiteTheme.textTheme.titleSmall),
                const SizedBox(width: 8),
                Text('2/39',
                    textAlign: TextAlign.left,
                    style: whiteTheme.textTheme.bodySmall),
              ],
            ),
            const SizedBox(height: 100),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                    color:
                        selectedGender.isNotEmpty ? Colors.black : Colors.grey,
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
                onPressed: _isButtonActive ? () {} : null,
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
        ),
      ),
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
