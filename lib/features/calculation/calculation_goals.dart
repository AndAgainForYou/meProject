import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateImpGoalsListWidget extends StatefulWidget {
  const CalculateImpGoalsListWidget({Key? key}) : super(key: key);

  @override
  _CalculateImpGoalsListWidgetState createState() =>
      _CalculateImpGoalsListWidgetState();
}

class _CalculateImpGoalsListWidgetState
    extends State<CalculateImpGoalsListWidget> {
  List<String> titles = [
    'Nutrition Adjustments for Competition Preparation',
    'Endurance Training',
    'Better Muscle Recovery',
    'Optimal Performance',
    'Pre-Competition preparation (1month)',
    'Post-Competition Recovery',
    'Better Athletic Performance',
    'Health Optimisation',
    'Better Training and Recovery',
    ' Achieving Peak Performance',
  ];
  List<bool> _isCheckedList = [];

  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        Text(
          'What is the most important goal for you now',
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
                isChecked: _isCheckedList[index],
                onTilePressed: (isChecked) {
                  setState(() {
                    _isCheckedList[index] = isChecked;
                    CalculateGlobalWidget.of(context)
                        .setButtonActivity(_isCheckedList.contains(true));
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
