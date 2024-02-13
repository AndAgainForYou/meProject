import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateSupplementsListWidget extends StatefulWidget {
  const CalculateSupplementsListWidget({Key? key}) : super(key: key);

  @override
  _CalculateSupplementsListWidgetState createState() =>
      _CalculateSupplementsListWidgetState();
}

class _CalculateSupplementsListWidgetState
    extends State<CalculateSupplementsListWidget> {
  List<String> titles = [
    'Multivitamins',
    'Vitamin D',
    'Omega 3',
    'Calcium',
    'Iron',
    'Vitamin B12',
    'Magnesium',
    'BCAAs',
    'CLA',
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
        const SizedBox(height: 63),
        Text(
          'Supplements',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const Text(
          'Choose the ones below',
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
                    choosedTitles.add(titles[index]);
                    _isCheckedList[index] = isChecked;
                    CalculateGlobalWidget.of(context)
                        .userModelBuilder
                        .supplements = choosedTitles;
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
