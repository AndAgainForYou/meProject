import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateCurrentDietWidget extends StatefulWidget {
  const CalculateCurrentDietWidget({Key? key}) : super(key: key);

  @override
  _CalculateCurrentDietWidgetState createState() =>
      _CalculateCurrentDietWidgetState();
}

class _CalculateCurrentDietWidgetState
    extends State<CalculateCurrentDietWidget> {
  List<String> titles = [
    'Fasting',
    'Mediterranean',
    'DASH Diet',
    'Keto',
    'Lacto-ovo vegetarian',
    'Ovo-vegetarian',
    'Lacto-vegetarian',
    'Vegan',
    'Pescatarian',
    'Gluten-Free',
    'Lactose-Free',
    'Paleo',
    'Anything/No specific \npreference',
  ];
  List<String?> subTitles = [
    null,
    null,
    null,
    null,
    'Eat dairy foods and eggs but not\nmeat, poultry or seafood',
    'Include eggs but avoid all other\nanimal foods, including dairy',
    'Eat dairy foods but exclude eggs,\nmeat, poultry and seafood',
    'Don’t eat any animal products\nincluding honey, dairy and eggs',
    'Eat fish and/or shellfish',
    null,
    null,
    null,
    null,
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
          'Choose your current diet',
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
                subtitle: subTitles[index],
                onTilePressed: (isChecked) {
                  setState(() {
                    choosedTitles.add(titles[index]);
                    _isCheckedList[index] = isChecked;
                    CalculateGlobalWidget.of(context)
                        .userModelBuilder
                        .chronic_diseases = choosedTitles;
                    CalculateGlobalWidget.of(context)
                        .setButtonActivity(_isCheckedList.contains(true));
                    CalculateGlobalWidget.of(context)
                        .userModelBuilder
                        .current_diet = choosedTitles;
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
