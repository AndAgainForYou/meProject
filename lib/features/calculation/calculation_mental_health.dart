import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateMentalHealthWidget extends StatefulWidget {
  const CalculateMentalHealthWidget({super.key});

  @override
  State<CalculateMentalHealthWidget> createState() =>
      _CalculateMentalHealthWidgetState();
}

class _CalculateMentalHealthWidgetState
    extends State<CalculateMentalHealthWidget> {
  List<String> titles = [
    'Improve concentration',
    'Reduce stress and anxiety',
    'Develop healthy habits',
    'Fight insomnia',
  ];
  List<bool> _isCheckedList = [];

  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 63),
          Text(
            'Mental Health',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const Text(
            'Select a target',
            style: TextStyle(color: Colors.grey, fontSize: 16),
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
      ),
    );
  }
}
