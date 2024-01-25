import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateFastingDaysWidget extends StatefulWidget {
  const CalculateFastingDaysWidget({super.key});

  @override
  State<CalculateFastingDaysWidget> createState() =>
      _CalculateFastingDaysWidgetState();
}

class _CalculateFastingDaysWidgetState
    extends State<CalculateFastingDaysWidget> {
  bool _isButtonActive = false;
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  List<bool> isSelected = List.generate(7, (index) => false);

  @override
  void initState() {
    bool _isButtonActive = false;
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
            'Indicate fasting days',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'What is your eating type?',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(days.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected[index] = !isSelected[index];
                    isSelected.contains(true)
                        ? _isButtonActive = true
                        : _isButtonActive = false;
                  });
                },
                child: Column(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: isSelected[index]
                            ? const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFF8064),
                                  Color(0xFFDB3D1A),
                                ],
                              )
                            : null,
                        color: isSelected[index]
                            ? null
                            : const Color.fromRGBO(23, 23, 23, 0.25),
                      ),
                      child: Center(
                        child: Text(
                          days[index],
                          style: TextStyle(
                            color:
                                isSelected[index] ? Colors.white : Colors.white,
                            fontSize: 18,
                            fontFamily: 'Gilroy',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
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
