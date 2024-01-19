import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';
import 'package:wheel_slider/wheel_slider.dart';

class CalculateWeightWidget extends StatefulWidget {
  const CalculateWeightWidget({Key? key}) : super(key: key);

  @override
  _CalculateWeightWidgetState createState() => _CalculateWeightWidgetState();
}

class _CalculateWeightWidgetState extends State<CalculateWeightWidget> {
  String _heightController = '';
  final int _nTotalCount = 300;
  final int _nInitValue = 65;
  int _nCurrentValue = 65;
  bool _isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'What is your weight?',
              textAlign: TextAlign.center,
              style: whiteTheme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 15),
            _heightController.isEmpty
                ? Text(
                    '.../kg',
                    textAlign: TextAlign.center,
                    style: whiteTheme.textTheme.titleMedium,
                  )
                : Text(
                    '$_heightController/kg',
                    textAlign: TextAlign.center,
                    style: whiteTheme.textTheme.titleMedium!
                        .copyWith(color: Colors.black),
                  ),
          ],
        ),
        const SizedBox(height: 20),
        const Row(
          children: [
            Text(
              '  Weight',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        //TODO: Gradient on slider
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 1),
          height: 60,
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
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(top: 3),
                height: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
              ),
              WheelSlider.number(
                perspective: 0.0001,
                totalCount: _nTotalCount,
                initValue: _nInitValue,
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
                    _isButtonActive = true;
                  });
                },
                hapticFeedbackType: HapticFeedbackType.heavyImpact,
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
            onPressed: _isButtonActive
                ? () {
                    FocusScope.of(context).unfocus();
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
}
