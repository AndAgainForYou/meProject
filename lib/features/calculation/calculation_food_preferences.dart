import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateFoodPreferencesWidget extends StatefulWidget {
  const CalculateFoodPreferencesWidget({Key? key}) : super(key: key);

  @override
  _CalculateFoodPreferencesWidgetState createState() =>
      _CalculateFoodPreferencesWidgetState();
}

class _CalculateFoodPreferencesWidgetState
    extends State<CalculateFoodPreferencesWidget> {
  List<String> titles = [
    '1-2 TPD',
    '3 TPD',
    '4 TPD',
    '5 TPD',
    'Only snacks',
    'Intermediate Fasting',
  ];
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Food Preferences',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 14),
        const Text(
          'How often do you prefer to eat?',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
            fontSize: 16,
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
                    _selectedIndex = isChecked ? index : null;
                    CalculateGlobalWidget.of(context)
                        .setButtonActivity(_selectedIndex != null);
                    CalculateGlobalWidget.of(context)
                        .userModelBuilder
                        .tpd_count = titles[index];
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
