import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateIntermediateFastingWidget extends StatefulWidget {
  const CalculateIntermediateFastingWidget({super.key});

  @override
  State<CalculateIntermediateFastingWidget> createState() =>
      _CalculateIntermediateFastingWidgetState();
}

class _CalculateIntermediateFastingWidgetState
    extends State<CalculateIntermediateFastingWidget> {
  List<String> titles = [
    '16/8 Fasting',
    '5:2 Fasting',
  ];
  List<String> subTitles = [
    '(16 hours fasting, 8 hours eating)',
    '(5 days regular eating, 2 days reduced calories)',
  ];
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Intermediate Fasting',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 14),
        const Text(
          'What is your eating type?',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTileWithRadio(
                title: titles[index],
                isChecked: _selectedIndex == index,
                subtitle: subTitles[index],
                onTilePressed: (isChecked) {
                  setState(() {
                    if (isChecked) {
                      _selectedIndex = index;
                      CalculateGlobalWidget.of(context).setButtonActivity(true);
                      CalculateGlobalWidget.of(context).userModelBuilder.tpds =
                          [titles[index]];
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
