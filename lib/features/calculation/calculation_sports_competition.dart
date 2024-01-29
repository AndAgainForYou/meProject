import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateSportCompetitionWidget extends StatefulWidget {
  const CalculateSportCompetitionWidget({Key? key}) : super(key: key);

  @override
  _CalculateSportCompetitionWidgetState createState() =>
      _CalculateSportCompetitionWidgetState();
}

class _CalculateSportCompetitionWidgetState
    extends State<CalculateSportCompetitionWidget> {
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
          'Do you plan to take part in a sports competition?',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
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
