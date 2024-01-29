import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateHealthStatusHabitsWidget extends StatefulWidget {
  const CalculateHealthStatusHabitsWidget({super.key});

  @override
  State<CalculateHealthStatusHabitsWidget> createState() =>
      _CalculateHealthStatusHabitsWidgetState();
}

class _CalculateHealthStatusHabitsWidgetState
    extends State<CalculateHealthStatusHabitsWidget> {
  List<String> titles = [
    'Smoking',
    'Alcohol Consumption ',
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
        const SizedBox(height: 63),
        Text(
          'Health status',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const Text(
          'Do you have any of these habits?',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.grey,
          ),
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
