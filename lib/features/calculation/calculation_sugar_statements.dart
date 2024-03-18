import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateSugarStatementsWidget extends StatefulWidget {
  const CalculateSugarStatementsWidget({Key? key}) : super(key: key);

  @override
  _CalculateSugarStatementsWidgetState createState() =>
      _CalculateSugarStatementsWidgetState();
}

class _CalculateSugarStatementsWidgetState
    extends State<CalculateSugarStatementsWidget> {
  List<String> titles = [
    "I limit sugar intake",
    "I don't eat sweets but like processed food",
    'I would be happy to control my sugar intake but currently not doing it',
    'I like sweets and consume them every day',
    "When I'm upset sugar helps me to feel better",
  ];
  Map<String, dynamic> _selectedOptions = {};
  int? _selectedIndexState;

  void isActive() {
    if (_selectedOptions['sugar_statements'] != null) {
      CalculateGlobalWidget.of(context).setButtonActivity(true);
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
            'Statements about sugar',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 30),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTileWithRadio(
                title: titles[index],
                isChecked: _selectedIndexState == index,
                customStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                ),
                onTilePressed: (isChecked) {
                  setState(() {
                    if (isChecked) {
                      _selectedIndexState = index;
                      _selectedOptions['sugar_statements'] = titles[index];
                      isActive();
                    } else {
                      _selectedIndexState = null;
                      _selectedOptions['sugar_statements'] = null;
                      CalculateGlobalWidget.of(context)
                          .setButtonActivity(false);
                    }
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
