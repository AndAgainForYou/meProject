import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateMentalHealthWidget extends StatefulWidget {
  const CalculateMentalHealthWidget({super.key});

  @override
  State<CalculateMentalHealthWidget> createState() =>
      _CalculateMentalHealthWidgetState();
}

class _CalculateMentalHealthWidgetState
    extends State<CalculateMentalHealthWidget> {
  List<String> titles = [
    'Better concentration',
    'Reduce stress and anxiety',
    'Reduce Brain Fog',
  ];
  List<bool> _isCheckedList = [];
  int? _selectedIndex;
  List<String> choosedTitles = [];
  bool _isButtonActive = false;
  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        leadingWidth: 130,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  FocusScope.of(context).unfocus();
                },
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        surfaceTintColor: Colors.transparent,
        title: Image.asset(
          'assets/images/logo_small.png',
          height: 32,
          width: 32,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
              const Text(
                'Pick one thing',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return CustomListTileWithRadio(
                      title: titles[index],
                      isChecked: _selectedIndex == index,
                      onTilePressed: (isChecked) {
                        setState(
                          () {
                            if (isChecked) {
                              _selectedIndex = index;
                              _isButtonActive = true;
                            } else {
                              _selectedIndex = null;
                              _isButtonActive = false;
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                height: 54.0,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color:
                      _isButtonActive ? Color(0xFFA4AC9C) : Color(0xFFCDC9C4),
                ),
                child: ElevatedButton(
                  onPressed: _isButtonActive
                      ? () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pop([titles[_selectedIndex!]]);
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
                    'Save',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
