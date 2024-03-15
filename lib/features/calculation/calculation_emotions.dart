import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateEmotionsHealthWidget extends StatefulWidget {
  const CalculateEmotionsHealthWidget({Key? key}) : super(key: key);

  @override
  _CalculateEmotionsHealthWidgetState createState() =>
      _CalculateEmotionsHealthWidgetState();
}

class _CalculateEmotionsHealthWidgetState
    extends State<CalculateEmotionsHealthWidget> {
  List<String> titles = [
    'Low',
    'Normal',
    'High',
  ];
  List<String> titlesImages = [
    'sad',
    'happy',
    'angry',
  ];
  List<String> titlesAnxiety = [
    'Yes',
    'No',
  ];
  Map<String, dynamic> _selectedOptionsEmotions = {};
  int? _selectedIndex;
  int? _selectedIndexEmotions;
  List<bool> _isCheckedList = [false, false, false];

  void isActive() {
    if (_selectedOptionsEmotions.isNotEmpty &&
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
          'Your emotional wellbeing',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          'Stress level',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.titleSmall,
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Container(
                height: 190,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  border: _selectedIndexEmotions == index
                      ? Border.all(
                          color: Color.fromRGBO(164, 171, 155, 1),
                          width: 2,
                        )
                      : null,
                ),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndexEmotions = index;
                      _selectedOptionsEmotions[titles[index]] = titles[index];
                      isActive();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/${titlesImages[index]}-image.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        titles[index],
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Anxiety',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.titleSmall,
        ),
        const SizedBox(
          height: 15,
        ),
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
                      CalculateGlobalWidget.of(context).setButtonActivity(true);
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
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
