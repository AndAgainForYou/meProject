import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateSkinAndBeautyWidget extends StatefulWidget {
  const CalculateSkinAndBeautyWidget({super.key});

  @override
  State<CalculateSkinAndBeautyWidget> createState() =>
      _CalculateSkinAndBeautyWidgetState();
}

class _CalculateSkinAndBeautyWidgetState
    extends State<CalculateSkinAndBeautyWidget> {
  List<String> titles = [
    'Reduce Akne',
    'Reduce skin aging effects',
    'Improve Hair Health',
  ];
  List<bool> _isCheckedList = [];
  List<String> choosedTitles = [];
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
            'Skin and Beauty',
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
                      choosedTitles.add(titles[index]);
                      _isCheckedList[index] = isChecked;
                      CalculateGlobalWidget.of(context)
                          .userModelBuilder
                          .mental_health_goals = choosedTitles;
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
