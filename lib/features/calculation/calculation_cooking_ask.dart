import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateCookingAskWidget extends StatefulWidget {
  const CalculateCookingAskWidget({super.key});

  @override
  State<CalculateCookingAskWidget> createState() =>
      _CalculateCookingAskWidgetState();
}

class _CalculateCookingAskWidgetState extends State<CalculateCookingAskWidget> {
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
          'Do you have a preference for cooking methods?',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
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
                    if (titles[index] == "Yes") {
                      CalculateGlobalWidget.of(context)
                          .userModelBuilder
                          .is_cooking_preference = true;
                    } else {
                      CalculateGlobalWidget.of(context)
                          .userModelBuilder
                          .is_cooking_preference = false;
                    }
                    CalculateGlobalWidget.of(context).setButtonActivity(true);
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
