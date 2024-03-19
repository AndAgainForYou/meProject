import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';
import 'package:wheel_slider/wheel_slider.dart';

class CalculateAgeWidget extends StatefulWidget {
  const CalculateAgeWidget({Key? key}) : super(key: key);

  @override
  _CalculateAgeWidgetState createState() => _CalculateAgeWidgetState();
}

class _CalculateAgeWidgetState extends State<CalculateAgeWidget> {
  bool _isButtonActive = false;
  final int _nTotalCount = 100;
  final int _nInitValue = 18;
  int _nCurrentValue = 18;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const SizedBox(
        //   height: 40,
        // ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'What’s your age?',
              textAlign: TextAlign.center,
              style: whiteTheme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 14),
            Text(
              'This will help us make adjustments to your \npersonal plan',
              style: whiteTheme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(196, 203, 185, 1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Center(
                        child: Text(
                          '              у.о',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                WheelSlider.number(
                  horizontal: false,
                  isInfinite: false,
                  listWidth: 200,
                  verticalListHeight: 278,
                  verticalListWidth: 340,
                  perspective: 0.001,
                  totalCount: _nTotalCount,
                  initValue: _nInitValue,
                  animationDuration: const Duration(milliseconds: 500),
                  selectedNumberStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  ),
                  unSelectedNumberStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                  currentIndex: _nCurrentValue,
                  onValueChanged: (val) {
                    setState(() {
                      _nCurrentValue = val;
                      CalculateGlobalWidget.of(context).userModelBuilder.age =
                          val;
                      CalculateGlobalWidget.of(context).setButtonActivity(true);
                    });
                  },
                  hapticFeedbackType: HapticFeedbackType.heavyImpact,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
