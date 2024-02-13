import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateDeliveryListWidget extends StatefulWidget {
  const CalculateDeliveryListWidget({Key? key}) : super(key: key);

  @override
  _CalculateDeliveryListWidgetState createState() =>
      _CalculateDeliveryListWidgetState();
}

class _CalculateDeliveryListWidgetState
    extends State<CalculateDeliveryListWidget> {
  List<String> titles = [
    'Italian Cuisine',
    'French Cuisine',
    'Chinese Cuisine',
    'Japanese Cuisine',
    'Indian Cuisine',
    'Mexican Cuisine',
    'Mediterranean Cuisine',
    'Home style dinner',
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
          'Do you plan to use delivery services this week?',
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
                    choosedTitles.add(titles[index]);
                    _isCheckedList[index] = isChecked;
                    CalculateGlobalWidget.of(context)
                        .userModelBuilder
                        .delivery_cuisine = choosedTitles;
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
