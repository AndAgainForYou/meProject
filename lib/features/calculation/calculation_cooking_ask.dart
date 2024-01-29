import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
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
        const SizedBox(height: 73),
        Text(
          'Do you have a preference for cooking methods?',
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
                        .saveAnswer('coocking_ask', titles[_selectedIndex!]);
                    CalculateGlobalWidget.of(context)
                        .setButtonActivity(_selectedIndex != null);
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
