import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateWeightLossSliderWidget extends StatefulWidget {
  const CalculateWeightLossSliderWidget({super.key});

  @override
  State<CalculateWeightLossSliderWidget> createState() => _CalculateWeightLossSliderWidgetState();
}

class _CalculateWeightLossSliderWidgetState extends State<CalculateWeightLossSliderWidget> {

  bool _isButtonActive = false;
  List<bool> _isCheckedList = [];

  double _currentSliderValue = 0;
  String? _sliderStatus;

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
          const Spacer(),
          Text(
            'Weight loss',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          const Text('How much do you want to weigh', style: TextStyle(
            color: Colors.grey,
            fontSize: 16
          ),),
          
            Text('${_currentSliderValue.toInt()} kg', style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Gilroy'
            ),),
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
                  });
                },
                onChangeEnd: (double value) {
                  setState(() {
                    _sliderStatus = 'Finished sliding';
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
          const SizedBox(height: 10),
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
      ),
    );
  }
}