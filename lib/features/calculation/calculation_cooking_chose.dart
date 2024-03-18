import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateCookingChoseWidget extends StatefulWidget {
  const CalculateCookingChoseWidget({super.key});

  @override
  State<CalculateCookingChoseWidget> createState() =>
      _CalculateCookingChoseWidgetState();
}

class _CalculateCookingChoseWidgetState
    extends State<CalculateCookingChoseWidget> {
  List<String> titles = [
    'Grilled',
    'Baked',
    'Steamed',
    'Sauteed',
    'Raw',
    'Slow Cooked',
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Choose the most comfortable for you',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTileWithRadio(
                title: titles[index],
                isChecked: _isCheckedList[index],
                onTilePressed: (isChecked) {
                  setState(() {
                    _isCheckedList[index] = isChecked;
                    choosedTitles.add(titles[index]);
                    CalculateGlobalWidget.of(context)
                        .userModelBuilder
                        .cooking_preferences = choosedTitles;
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
