import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/custom_list_tile_image.dart';
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
  List<String> imageTitles = [
    'italian',
    'french',
    'chinese',
    'japanese',
    'mexican',
    'indian',
    'mediterranean',
    'home-food',
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
          'Do you plan to use delivery\nservices this week?',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTileWithImage(
                title: titles[index],
                isChecked: _isCheckedList[index],
                imageName: imageTitles[index],
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
