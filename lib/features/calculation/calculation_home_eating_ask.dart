import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
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
        Text(
          'Plan outside home eating',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 14),
        const Text(
          'Do you plan to have a meal outside of your\nhome this week?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTileWithRadio(
                title: titles[index],
                isChecked: _selectedIndex == index,
                onTilePressed: (isChecked) {
                  setState(() {
                    if (isChecked) {
                      _selectedIndex = index;
                      if (titles[index] == "Yes") {
                        CalculateGlobalWidget.of(context)
                            .userModelBuilder
                            .is_outside_eating = true;
                      } else {
                        CalculateGlobalWidget.of(context)
                            .userModelBuilder
                            .is_outside_eating = false;
                      }
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
