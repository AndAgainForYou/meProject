import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math';

class MealGenerationPage extends StatefulWidget {
  const MealGenerationPage({super.key});

  @override
  State<MealGenerationPage> createState() => _MealGenerationPageState();
}

class _MealGenerationPageState extends State<MealGenerationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.arrow_back), Text('Back')],
          ),
          onPressed: () {
            // Navigator.of(context).pop();
          },
        ),
        leadingWidth: 90,
        title: Image.asset('assets/images/logo_small.png'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'We generate a meal plan for you',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Wait a bit',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 65.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircularStepProgressIndicator(
                    totalSteps: 20,
                    currentStep: 10,
                    stepSize: 50,
                    selectedColor: Colors.red,
                    unselectedColor: Colors.purple[400],
                    padding: 3.14 / 20,
                    width: 290,
                    height: 290,
                    startingAngle: -3.14 * 2 / 3.5,
                    arcSize: 3.14 * 2 / 3 * 2.2,
                    gradientColor: const LinearGradient(
                      colors: [Color(0xFFAFCD6D), Color(0xFF59A7A7)],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          '54%',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            fontFamily: 'Gilroy',
                          ),
                        )),
                        Text(
                          'Loading',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy',
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
