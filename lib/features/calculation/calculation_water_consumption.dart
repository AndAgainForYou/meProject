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
  int? _selectedIndex;
  int? _selectedIndexState;

  void isActive() {
    if (CalculateGlobalWidget.of(context).userModelBuilder.water_consumption !=
            null &&
        CalculateGlobalWidget.of(context).userModelBuilder.closer_statements !=
            null) {
      CalculateGlobalWidget.of(context).setButtonActivity(true);
    } else {
      CalculateGlobalWidget.of(context).setButtonActivity(false);
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

                      CalculateGlobalWidget.of(context)
                          .userModelBuilder
                          .water_consumption = titlesAnxiety[_selectedIndex!];
                      isActive();
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
                containerHeight: 100,
                onTilePressed: (isChecked) {
                  setState(() {
                    if (isChecked) {
                      _selectedIndexState = index;

                      CalculateGlobalWidget.of(context)
                          .userModelBuilder
                          .closer_statements = titles[_selectedIndexState!];
                      isActive();
                    } else {
                      _selectedIndexState = null;
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
