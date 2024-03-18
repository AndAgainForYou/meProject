import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateCurrentSymptomsWidget extends StatefulWidget {
  const CalculateCurrentSymptomsWidget({Key? key}) : super(key: key);

  @override
  _CalculateCurrentSymptomsWidgetState createState() =>
      _CalculateCurrentSymptomsWidgetState();
}

class _CalculateCurrentSymptomsWidgetState
    extends State<CalculateCurrentSymptomsWidget> {
  List<String> titles = [
    "Hormonal Fluctuations",
    "Hot Flashes",
    'Weight Management',
    'Bone Health',
    "Mood Swings",
    'Insomnia and Sleep \nDisturbances',
    'Joint Pain',
    'Skin Changes',
    'Vaginal problems and \ninfections',
    'Cardiovascular Health',
    'High Blood Sugar Levels',
    'Urinary problems',
    'Cognitive Function',
    'Persistent Headaches and \nMigraines',
    'Hair growth',
    'Oral health',
  ];
  Map<String, List<String>> _selectedOptions = {};
  List<bool> _isCheckedList = [];
  List<String> choosedTitles = [];
  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  void isActive() {
    if (_selectedOptions['current_symptoms']!.isNotEmpty) {
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
            'Current symptoms',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 15),
          Text(
            'You can choose more than one',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodySmall,
          ),
          const SizedBox(height: 25),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                title: titles[index],
                isChecked: _isCheckedList[index],
                onTilePressed: (isChecked) {
                  setState(() {
                    choosedTitles.add(titles[index]);
                    _isCheckedList[index] = isChecked;
                    CalculateGlobalWidget.of(context)
                        .userModelBuilder
                        .current_symptoms = choosedTitles;
                    CalculateGlobalWidget.of(context)
                        .setButtonActivity(_isCheckedList.contains(true));
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
