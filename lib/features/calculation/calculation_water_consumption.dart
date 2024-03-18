import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateWaterConsumptionWidget extends StatefulWidget {
  const CalculateWaterConsumptionWidget({Key? key}) : super(key: key);

  @override
  _CalculateWaterConsumptionWidgetState createState() =>
      _CalculateWaterConsumptionWidgetState();
}

class _CalculateWaterConsumptionWidgetState
    extends State<CalculateWaterConsumptionWidget> {
  List<String> titles = [
    "When I'm upset sugar helps me to feel better",
    'I would be happy to control my sugar intake but currently not doing it',
    'I like sweets and consume them every day',
    'I rarely consume sugar',
    "I don't eat sweets but like processed food",
  ];
  List<String> titlesAnxiety = [
    'Low',
    'High',
  ];
  Map<String, dynamic> _selectedOptions = {};
  int? _selectedIndex;
  int? _selectedIndexState;
  List<bool> _isCheckedList = [false, false, false];

  void isActive() {
    if (_selectedOptions['water_consumption'] != null &&
        _selectedOptions['statements'] != null) {
      CalculateGlobalWidget.of(context).setButtonActivity(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Water consumption \nthroughout a day',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 30),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: titlesAnxiety.length,
            itemBuilder: (context, index) {
              return CustomListTileWithRadio(
                title: titlesAnxiety[index],
                isChecked: _selectedIndex == index,
                onTilePressed: (isChecked) {
                  setState(() {
                    if (isChecked) {
                      _selectedIndex = index;
                      _selectedOptions['water_consumption'] =
                          titlesAnxiety[index];
                      print(_selectedOptions['water_consumption']);
                      isActive();
                    } else {
                      _selectedIndex = null;
                      _selectedOptions['water_consumption'] = null;
                      CalculateGlobalWidget.of(context)
                          .setButtonActivity(false);
                    }
                  });
                },
              );
            },
          ),
          const SizedBox(height: 40),
          Text(
            'Which of the statements is closer to you?',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 30),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTileWithRadio(
                title: titles[index],
                isChecked: _selectedIndexState == index,
                customStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                ),
                onTilePressed: (isChecked) {
                  setState(() {
                    if (isChecked) {
                      _selectedIndexState = index;
                      _selectedOptions['statements'] = titles[index];
                      print(_selectedOptions['statements']);
                      isActive();
                    } else {
                      _selectedIndexState = null;
                      _selectedOptions['statements'] = null;
                      CalculateGlobalWidget.of(context)
                          .setButtonActivity(false);
                    }
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
