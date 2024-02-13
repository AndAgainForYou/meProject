import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateCurrentDietWidget extends StatefulWidget {
  const CalculateCurrentDietWidget({Key? key}) : super(key: key);

  @override
  _CalculateCurrentDietWidgetState createState() =>
      _CalculateCurrentDietWidgetState();
}

class _CalculateCurrentDietWidgetState
    extends State<CalculateCurrentDietWidget> {
  List<String> titles = [
    'Mediterranean',
    'Keto',
    'Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Paleo',
  ];
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 63),
        Text(
          'Choose your current diet',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                title: titles[index],
                isChecked: _selectedIndex == index,
                onTilePressed: (isChecked) {
                  setState(() {
                    _selectedIndex = isChecked ? index : null;
                    CalculateGlobalWidget.of(context)
                        .setButtonActivity(_selectedIndex != null);
                    CalculateGlobalWidget.of(context)
                        .userModelBuilder
                        .current_diet = titles[index];
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
