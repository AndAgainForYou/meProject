import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateDiversityPlanWidget extends StatefulWidget {
  const CalculateDiversityPlanWidget({Key? key, required this.onfinished})
      : super(key: key);
  final VoidCallback onfinished;
  @override
  _CalculateDiversityPlanWidgetState createState() =>
      _CalculateDiversityPlanWidgetState();
}

class _CalculateDiversityPlanWidgetState
    extends State<CalculateDiversityPlanWidget> {
  List<String> titles = [
    'Each day new meal plan',
    'New meal plan each second day',
    'Same meal plan Mo-Fri and diverse plan for Sa-So',
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
          'Diversity of the plan',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const Text(
          'How often do you want to cook?',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.grey,
          ),
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
                    if (isChecked) {
                      _selectedIndex = index;
                      widget.onfinished();
                      CalculateGlobalWidget.of(context)
                          .userModelBuilder
                          .diversity = titles[index];
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
      ],
    );
  }
}
