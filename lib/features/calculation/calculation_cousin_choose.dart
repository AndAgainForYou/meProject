import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/custom_list_tile_image.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateCousinListWidget extends StatefulWidget {
  const CalculateCousinListWidget({Key? key}) : super(key: key);

  @override
  _CalculateCousinListWidgetState createState() =>
      _CalculateCousinListWidgetState();
}

class _CalculateCousinListWidgetState extends State<CalculateCousinListWidget> {
  List<String> titles = [
    'Italian Cuisine',
    'French Cuisine',
    'Chinese Cuisine',
    'Japanese Cuisine',
    'Mexican Cuisine',
    'Indian Cuisine',
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
          'World cuisine',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 14),
        const Text(
          'Choose the ones below',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
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
                imageName: imageTitles[index],
                onTilePressed: (isChecked) {
                  setState(() {
                    choosedTitles.add(titles[index]);
                    _isCheckedList[index] = isChecked;
                    CalculateGlobalWidget.of(context)
                        .userModelBuilder
                        .outside_eating_cuisine = choosedTitles;
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
