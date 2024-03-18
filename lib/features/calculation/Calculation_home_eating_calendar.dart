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
      backgroundColor: Color.fromARGB(255, 240, 242, 236),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Plan outside home eating',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 14),
          const Text(
            'When do you plan to make it?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 30),
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
                        color: isSelected[index]
                            ? Color.fromRGBO(164, 171, 155, 1)
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          days[index],
                          style: TextStyle(
                            color: isSelected[index]
                                ? Colors.white
                                : Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
