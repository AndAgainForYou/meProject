import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateEmotionsHealthWidget extends StatefulWidget {
  const CalculateEmotionsHealthWidget({Key? key}) : super(key: key);

  @override
  _CalculateEmotionsHealthWidgetState createState() =>
      _CalculateEmotionsHealthWidgetState();
}

class _CalculateEmotionsHealthWidgetState
    extends State<CalculateEmotionsHealthWidget> {
  List<String> titlesAnxiety = [
    'Anger and irritability',
    'Stress and anxiety',
    'Forgetfulness',
    'Loss of self-esteem',
    'Loss of confidence',
    'Low mood and feelings of \nsadness or depression',
    ' Poor concentration',
  ];

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Your emotional wellbeing',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: titlesAnxiety.length,
            itemBuilder: (context, index) {
              return CustomListTileWithRadio(
                title: titlesAnxiety[index],
                isChecked: _selectedIndex == index,
                onTilePressed: (isChecked) {
                  setState(() {
                    if (isChecked) {
                      _selectedIndex = index;
                      CalculateGlobalWidget.of(context)
                          .userModelBuilder
                          .emotional_wellbeing = titlesAnxiety[_selectedIndex!];
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
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
