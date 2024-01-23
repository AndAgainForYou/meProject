import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateSportCompetitionWidget extends StatefulWidget {
  const CalculateSportCompetitionWidget({Key? key}) : super(key: key);

  @override
  _CalculateSportCompetitionWidgetState createState() =>
      _CalculateSportCompetitionWidgetState();
}

class _CalculateSportCompetitionWidgetState
    extends State<CalculateSportCompetitionWidget> {
  List<String> titles = [
    'Yes',
    'No',
  ];
  bool _isButtonActive = false;
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        Text(
          'Do you plan to take part in a sports competition?',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                title: titles[index],
                isChecked: _selectedIndex == index,
                onTilePressed: (isChecked) {
                  setState(() {
                    if (isChecked) {
                      _selectedIndex =
                          index; // Встановлюємо індекс вибраного елементу
                      _isButtonActive = true;
                    } else {
                      _selectedIndex =
                          null; // Скасовуємо вибір, якщо було відзначено
                      _isButtonActive = false;
                    }
                  });
                },
              );
            },
          ),
        ),
        const Spacer(),
        Container(
          height: 54.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF59A7A7),
                Color(0xFFAFCD6D),
              ],
            ),
          ),
          child: ElevatedButton(
            onPressed: _isButtonActive
                ? () {
                    CalculateGlobalWidget.of(context).pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
