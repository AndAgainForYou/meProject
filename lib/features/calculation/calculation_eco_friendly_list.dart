import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/calculation_refregerator_food.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/multi_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateEcoFriendlyListWidget extends StatefulWidget {
  const CalculateEcoFriendlyListWidget({super.key});

  @override
  State<CalculateEcoFriendlyListWidget> createState() =>
      _CalculateEcoFriendlyListWidgetState();
}

class _CalculateEcoFriendlyListWidgetState
    extends State<CalculateEcoFriendlyListWidget> {
  List<String> titles = [
    'Reduce food wastage in my home',
    'Minimize amount of buying products',
    'Add more Bio products to my meals',
    'Use local products',
    'Use food in my refrigerator first',
  ];
  Map<String, List<String>> _selectedOptions = {};
  List<bool> _isCheckedList = [];
  List<String?> subtitles = [null];
  List<String> choosedTitles = [];
  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  void pushToSecondaryPages() async {
    if (_isCheckedList[4] == true &&
        CalculateGlobalWidget.of(context)
                .userModelBuilder
                .eco_friendly_eating ==
            null) {
      CalculateGlobalWidget.of(context).userModelBuilder.eco_friendly_eating =
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const CalculateRefrigeratorFoodWidget()));
      setState(() {
        if (CalculateGlobalWidget.of(context)
                .userModelBuilder
                .eco_friendly_eating !=
            null) {
          subtitles[0] = CalculateGlobalWidget.of(context)
              .userModelBuilder
              .eco_friendly_eating
              .toString();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'What is the most \nimportant goal for you now',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 15),
          Text(
            'You can choose more than one',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodySmall,
          ),
          const SizedBox(height: 25),
          MultiListTile(
            title: titles[0],
            isChecked: _isCheckedList[0],
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[0]);
                _isCheckedList[0] = isChecked;
                CalculateGlobalWidget.of(context)
                    .setButtonActivity(_isCheckedList.contains(true));
              });
            },
          ),
          MultiListTile(
            title: titles[1],
            isChecked: _isCheckedList[1],
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[1]);
                _isCheckedList[1] = isChecked;
                CalculateGlobalWidget.of(context)
                    .setButtonActivity(_isCheckedList.contains(true));
              });
            },
          ),
          MultiListTile(
            title: titles[2],
            isChecked: _isCheckedList[2],
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[2]);
                _isCheckedList[2] = isChecked;
                CalculateGlobalWidget.of(context)
                    .setButtonActivity(_isCheckedList.contains(true));
              });
            },
          ),
          MultiListTile(
            title: titles[3],
            isChecked: _isCheckedList[3],
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[3]);
                _isCheckedList[3] = isChecked;
                CalculateGlobalWidget.of(context)
                    .setButtonActivity(_isCheckedList.contains(true));
              });
            },
          ),
          MultiListTile(
            title: titles[4],
            isChecked: _isCheckedList[4],
            subTitle: _isCheckedList[4] ? subtitles[0] : null,
            buttonActive: subtitles[0]?.isNotEmpty,
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[4]);
                _isCheckedList[4] = isChecked;
                if (_isCheckedList[4]) {
                  pushToSecondaryPages();
                  CalculateGlobalWidget.of(context)
                      .setButtonActivity(_isCheckedList.contains(true));
                } else {
                  subtitles[0] = null;
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .eco_friendly_eating = null;
                  CalculateGlobalWidget.of(context)
                      .setButtonActivity(_isCheckedList.contains(false));
                }
              });
            },
            onPressed: () async {
              List<String>? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const CalculateRefrigeratorFoodWidget()));
              if (mounted && result != null) {
                CalculateGlobalWidget.of(context)
                    .userModelBuilder
                    .eco_friendly_eating = result;
              }
              setState(() {
                subtitles[0] = CalculateGlobalWidget.of(context)
                    .userModelBuilder
                    .eco_friendly_eating
                    .toString();
              });
            },
          ),
        ],
      ),
    );
  }
}
