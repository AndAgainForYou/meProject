import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateSkinAndBeautyWidget extends StatefulWidget {
  const CalculateSkinAndBeautyWidget({super.key});

  @override
  State<CalculateSkinAndBeautyWidget> createState() => _CalculateSkinAndBeautyWidgetState();
}

class _CalculateSkinAndBeautyWidgetState extends State<CalculateSkinAndBeautyWidget> {
 List<String> titles = [
    'Reduce Akne',
    'Reduce skin aging effects',
    'Improve Hair Health',
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 63),
          Text(
            'Skin and Beauty',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const Text('Select a target', style: TextStyle(
            color: Colors.grey,
            fontSize: 16
          ),),
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
      ),
    );
  }
}