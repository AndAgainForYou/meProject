import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateIntermediateFastingWidget extends StatefulWidget {
  const CalculateIntermediateFastingWidget({super.key});

  @override
  State<CalculateIntermediateFastingWidget> createState() => _CalculateIntermediateFastingWidgetState();
}

class _CalculateIntermediateFastingWidgetState extends State<CalculateIntermediateFastingWidget> {
  List<String> titles = [
    '16/8 Fasting (16 hours fasting, 8 hours eating)',
    '5:2 Fasting (5 days regular eating, 2 days reduced calories)',
  ];
  bool _isButtonActive = false;
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 63),
        Text(
          'Intermediate Fasting',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const Text('What is your eating type?', style: TextStyle(
            color: Colors.grey,
            fontSize: 16
          ),),
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
