import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
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
    'Indian Cuisine',
    'Mexican Cuisine',
    'Mediterranean Cuisine',
    'Home style dinner',
  ];
  bool _isButtonActive = false;
  List<bool> _isCheckedList = [];

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
        const SizedBox(height: 63),
        Text(
          'Which cousin do you want to choose?',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                title: titles[index],
                isChecked: _isCheckedList[index],
                onTilePressed: (isChecked) {
                  setState(() {
                    _isCheckedList[index] = isChecked;
                    _isButtonActive = _isCheckedList.contains(true);
                  });
                },
              );
            },
          ),
        ),
        const SizedBox(height: 10),
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
