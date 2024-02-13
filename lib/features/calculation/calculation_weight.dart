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
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: _heightController.isEmpty ? '...' : '',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: _heightController,
                    style: whiteTheme.textTheme.titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const TextSpan(
                    text: '/',
                    style: TextStyle(fontSize: 32),
                  ),
                  TextSpan(
                    text: 'kg',
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
              'Weight',
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
                  margin: const EdgeInsets.only(top: 3),
                  height: 45,
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
                      CalculateGlobalWidget.of(context)
                          .userModelBuilder
                          .weight = val;
                      CalculateGlobalWidget.of(context).setButtonActivity(true);
                    });
                  },
                  hapticFeedbackType: HapticFeedbackType.heavyImpact,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
