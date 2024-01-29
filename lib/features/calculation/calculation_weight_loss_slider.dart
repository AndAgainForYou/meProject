import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateWeightLossSliderWidget extends StatefulWidget {
  const CalculateWeightLossSliderWidget({super.key});

  @override
  State<CalculateWeightLossSliderWidget> createState() =>
      _CalculateWeightLossSliderWidgetState();
}

class _CalculateWeightLossSliderWidgetState
    extends State<CalculateWeightLossSliderWidget> {
  double _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 63),
          Text(
            'Weight loss',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'How much do you want to weigh',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          Text(
            '${_currentSliderValue.toInt()} kg',
            style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gilroy'),
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            child: CupertinoSlider(
              key: const Key('slider'),
              value: _currentSliderValue,
              divisions: 20,
              max: 100,
              activeColor: const Color.fromRGBO(252, 108, 76, 1),
              thumbColor: Colors.white,
              onChangeStart: (double value) {
                setState(() {
                  _sliderStatus = 'Sliding';
                  CalculateGlobalWidget.of(context).setButtonActivity(true);
                });
              },
              onChangeEnd: (double value) {
                setState(() {
                  _currentSliderValue.toInt() == 0
                      ? CalculateGlobalWidget.of(context)
                          .setButtonActivity(false)
                      : CalculateGlobalWidget.of(context)
                          .setButtonActivity(true);
                });
              },
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
