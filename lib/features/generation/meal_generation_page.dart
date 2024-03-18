import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
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
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo_small.png',
          height: 32,
          width: 32,
        ),
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/food.png', height: 267,),
            const Text('Just give me \na moment', textAlign: TextAlign.center, style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              height: 1.1
            ),),
            const SizedBox(height: 14),
            const Text('I am generating a meal plan for you', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300
            ),),
            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.only(left: 70.0, right: 70.0),
              child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 3000,
                        percent: 1,
                        barRadius: const Radius.circular(18),
                        backgroundColor: const Color.fromRGBO(230, 227, 223, 1),
                        linearGradient: const LinearGradient(colors: <Color>[
                          Color(0xFFffa384),
                          Color(0xFFffa384),
                          Color(0xFFffa384),
                          Color(0xFFa4aa9c),
                        ]),
                      ),
            ),
            const SizedBox(height: 5),
            const Text('Breakfast', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300
            ),),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 70.0, right: 70.0),
              child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 4000,
                        percent: 1,
                        barRadius: const Radius.circular(18),
                        backgroundColor: const Color.fromRGBO(230, 227, 223, 1),
                        linearGradient: const LinearGradient(colors: <Color>[
                          Color(0xFFffa384),
                          Color(0xFFffa384),
                          Color(0xFFffa384),
                          Color(0xFFa4aa9c),
                        ]),
                      ),
            ),
            const SizedBox(height: 5),
            const Text('Lunch', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300
            ),),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 70.0, right: 70.0),
              child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 5000,
                        percent: 1,
                        barRadius: const Radius.circular(18),
                        backgroundColor: const Color.fromRGBO(230, 227, 223, 1),
                        linearGradient: const LinearGradient(colors: <Color>[
                          Color(0xFFffa384),
                          Color(0xFFffa384),
                          Color(0xFFffa384),
                          Color(0xFFa4aa9c),
                        ]),
                      ),
            ),
            const SizedBox(height: 5),
            const Text('Dinner', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300
            ),),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 70.0, right: 70.0),
              child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 6000,
                        percent: 1,
                        barRadius: const Radius.circular(18),
                        backgroundColor: const Color.fromRGBO(230, 227, 223, 1),
                        linearGradient: const LinearGradient(colors: <Color>[
                          Color(0xFFffa384),
                          Color(0xFFffa384),
                          Color(0xFFffa384),
                          Color(0xFFa4aa9c),
                        ]),
                      ),
            ),
            const SizedBox(height: 5),
            const Text('Snack', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300
            ),),
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}
