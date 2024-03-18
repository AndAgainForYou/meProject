import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateCurrentGoalsWidget extends StatefulWidget {
  const CalculateCurrentGoalsWidget({Key? key}) : super(key: key);

  @override
  _CalculateCurrentGoalsWidgetState createState() =>
      _CalculateCurrentGoalsWidgetState();
}

class _CalculateCurrentGoalsWidgetState
    extends State<CalculateCurrentGoalsWidget> {
  List<String> titles = [
    "Gut Health",
    "Hydration",
    'Adapt to Changes',
    'Mood Stability',
    "Weight Management",
    'Hot Flash Management',
    'Cognitive function',
    'Muscle Mass Preservation',
    'Skin and Hair Health',
    'Insomnia and Sleep \nDisturbance Management',
    'Oral Health Management',
    'Cardiovascular Health',
    'Bone Health',
    'Vaginal Problems',
    'Urinary Problems',
    'High Blood Sugar levels',
    'Thyroid Health',
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
    if (_selectedOptions['current_goals']!.isNotEmpty) {
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
            'Current Goals',
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
              return CustomListTileWithRadio(
                title: titles[index],
                isChecked: _isCheckedList[index],
                onTilePressed: (isChecked) {
                  setState(() {
                    choosedTitles.add(titles[index]);
                    _isCheckedList[index] = isChecked;
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
