import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateHomeEatingAskWidget extends StatefulWidget {
  const CalculateHomeEatingAskWidget({super.key});

  @override
  State<CalculateHomeEatingAskWidget> createState() =>
      _CalculateHomeEatingAskWidgetState();
}

class _CalculateHomeEatingAskWidgetState
    extends State<CalculateHomeEatingAskWidget> {
  List<String> titles = [
    'Yes',
    'No',
  ];
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        Text(
          'Plan outside home eating',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const Text(
          'Do you plan to have a meal outside of your home this week?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                title: titles[index],
                isChecked: _selectedIndex == index,
                onTilePressed: (isChecked) {
                  setState(() {
                    if (isChecked) {
                      _selectedIndex = index;
                      CalculateGlobalWidget.of(context).saveAnswer(
                          'home_eating_ask', titles[_selectedIndex!]);
                      CalculateGlobalWidget.of(context).setButtonActivity(true);
                    } else {
                      _selectedIndex = null;
                      CalculateGlobalWidget.of(context)
                          .setButtonActivity(false);
                    }
                  });
                },
              );
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
