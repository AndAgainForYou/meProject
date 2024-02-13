import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateFourthTPDWidget extends StatefulWidget {
  const CalculateFourthTPDWidget({Key? key}) : super(key: key);

  @override
  _CalculateFourthTPDWidgetState createState() =>
      _CalculateFourthTPDWidgetState();
}

class _CalculateFourthTPDWidgetState extends State<CalculateFourthTPDWidget> {
  List<String> titles = [
    'Having a Snack',
    'Brunch and Dinner included',
  ];
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 63),
        Text(
          '4 TPD',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const Text(
          'What is your eating type?',
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
                isChecked: _selectedIndex == index,
                onTilePressed: (isChecked) {
                  setState(() {
                    _selectedIndex = isChecked ? index : null;
                    CalculateGlobalWidget.of(context)
                        .setButtonActivity(_selectedIndex != null);
                    CalculateGlobalWidget.of(context).userModelBuilder.tpds = [
                      titles[index]
                    ];
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
