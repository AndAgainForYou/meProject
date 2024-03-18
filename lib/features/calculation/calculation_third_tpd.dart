import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateThirdTPDWidget extends StatefulWidget {
  const CalculateThirdTPDWidget({Key? key}) : super(key: key);

  @override
  _CalculateThirdTPDWidgetState createState() =>
      _CalculateThirdTPDWidgetState();
}

class _CalculateThirdTPDWidgetState extends State<CalculateThirdTPDWidget> {
  List<String> titles = [
    'Balanced Breakfast, Lunch, and Dinner',
    'Big Breakfast and reduced Lunch and Dinner',
    'Small Breakfast but large Lunch and Dinner',
  ];
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '3 TPD',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 14),
        const Text(
          'What is your eating type?',
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
                customStyle: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                onTilePressed: (isChecked) {
                  setState(() {
                    _selectedIndex = isChecked ? index : null;
                    CalculateGlobalWidget.of(context)
                        .setButtonActivity(_selectedIndex != null);
                    CalculateGlobalWidget.of(context).userModelBuilder.tpds = [
                      titles[index]
                    ];
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
