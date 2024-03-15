import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateWaterConsumptionWidget extends StatefulWidget {
  const CalculateWaterConsumptionWidget({Key? key}) : super(key: key);

  @override
  _CalculateWaterConsumptionWidgetState createState() =>
      _CalculateWaterConsumptionWidgetState();
}

class _CalculateWaterConsumptionWidgetState
    extends State<CalculateWaterConsumptionWidget> {
  List<String> titles = [
    "When I'm upset sugar helps me to get better",
    'I would be happy to control my sugar intake but currently not doing it',
    'I like sweets and consume them every day',
    'I limit sugar intake',
    "I don't eat sweets but like processed food",
  ];
  List<String> titlesAnxiety = [
    'Low',
    'High',
  ];
  Map<String, dynamic> _selectedOptions = {};
  int? _selectedIndex;
  int? _selectedIndexState;
  List<bool> _isCheckedList = [false, false, false];

  void isActive() {
    if (_selectedOptions.isNotEmpty &&
        (_selectedIndex == 0 || _selectedIndex == 1)) {
      CalculateGlobalWidget.of(context).setButtonActivity(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Water consumption throughout a day',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: titlesAnxiety.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                title: titlesAnxiety[index],
                isChecked: _selectedIndex == index,
                onTilePressed: (isChecked) {
                  setState(() {
                    if (isChecked) {
                      _selectedIndex = index;
                      isActive();
                    } else {
                      _selectedIndex = null;
                      CalculateGlobalWidget.of(context)
                          .setButtonActivity(false);
                    }
                  });
                },
              );
            },
          ),
        ),
        Text(
          'Which of the statements is closer to you?',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  border: _selectedIndexState == index
                      ? Border.all(
                          color: Color.fromRGBO(164, 171, 155, 1),
                          width: 2,
                        )
                      : null,
                ),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      _selectedOptions[titles[index]] = titles[index];
                      isActive();
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(
                        value: titles[index],
                        activeColor: const Color.fromRGBO(164, 171, 155, 1),
                        groupValue: _selectedOptions[index],
                        onChanged: (value) {
                          setState(() {
                            _selectedOptions[titles[index]] = value.toString();
                            isActive();
                          });
                        },
                      ),
                      Flexible(
                        child: Text(
                          titles[index],
                          textAlign: TextAlign.start,
                          softWrap: true,
                          style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
