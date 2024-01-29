import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateAlergicListWidget extends StatefulWidget {
  const CalculateAlergicListWidget({Key? key}) : super(key: key);

  @override
  _CalculateAlergicListWidgetState createState() =>
      _CalculateAlergicListWidgetState();
}

class _CalculateAlergicListWidgetState
    extends State<CalculateAlergicListWidget> {
  List<String> titles = [
    'Dairy',
    'Nuts',
    'Gluten',
    'Shellfish',
    'Soy',
    'Eggs',
  ];
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
          'What are you allergic to?',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        const Text(
          'If you are not allergic, skip this step.',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                offset: Offset(1, 3),
                blurRadius: 9,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: ' Add your option separated by commas',
              hintStyle: const TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
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
