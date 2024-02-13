import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateHomeEatingCalendarWidget extends StatefulWidget {
  const CalculateHomeEatingCalendarWidget({super.key});

  @override
  State<CalculateHomeEatingCalendarWidget> createState() =>
      _CalculateHomeEatingCalendarWidgetState();
}

class _CalculateHomeEatingCalendarWidgetState
    extends State<CalculateHomeEatingCalendarWidget> {
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  List<bool> isSelected = List.generate(7, (index) => false);
  List<String> choosedTitles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 63),
          Text(
            'Plan outside home eating',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'When do you plan to make it?',
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
                    choosedTitles.add(days[index]);
                    CalculateGlobalWidget.of(context)
                        .userModelBuilder
                        .outside_eating_days = choosedTitles;
                    CalculateGlobalWidget.of(context)
                        .setButtonActivity(isSelected.contains(true));
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
        ],
      ),
    );
  }
}
