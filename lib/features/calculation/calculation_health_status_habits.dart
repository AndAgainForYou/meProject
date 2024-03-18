import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/custom_list_tile_image.dart';
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
  List<String> imageTitle = ['smoking', 'alcogol'];
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
          'Health status',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 14),
        const Text(
          'Do you have any of these habits?',
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
              return CustomListTileWithImage(
                title: titles[index],
                isChecked: _isCheckedList[index],
                imageName: imageTitle[index],
                onTilePressed: (isChecked) {
                  setState(() {
                    choosedTitles.add(titles[index]);
                    _isCheckedList[index] = isChecked;
                    CalculateGlobalWidget.of(context).userModelBuilder.habits =
                        choosedTitles;
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
