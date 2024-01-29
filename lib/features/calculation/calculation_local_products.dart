import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';

class CalculateLocalProductsWidget extends StatefulWidget {
  const CalculateLocalProductsWidget({super.key});

  @override
  State<CalculateLocalProductsWidget> createState() =>
      _CalculateLocalProductsWidgetState();
}

class _CalculateLocalProductsWidgetState
    extends State<CalculateLocalProductsWidget> {
  bool buttonSeason1Selected = false; //Season
  bool buttonSeason2Selected = true;
  bool buttonSeason3Selected = false;
  bool buttonSeason4Selected = false;

  String selectedRegion = 'Region';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Region", child: Text("Region")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 73),
        const Center(
          child: Column(
            children: [
              Text(
                'Use local products',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Mention the region of leaving and season of the year',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: 52,
          width: MediaQuery.of(context).size.width * 0.95,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.09),
                offset: Offset(1, 3),
                blurRadius: 9,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
                dropdownColor: Colors.white,
                isExpanded: true,
                value: selectedRegion,
                items: dropdownItems,
                onChanged: (value) {
                  setState(() {
                    selectedRegion = value!;
                    CalculateGlobalWidget.of(context).setButtonActivity(true);
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Season of the year',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              width: 0.20,
              label: 'Winter',
              isSelected: buttonSeason1Selected,
              onPressed: () {
                CalculateGlobalWidget.of(context).setButtonActivity(true);
                setState(() {
                  buttonSeason1Selected = true;
                  buttonSeason2Selected = false;
                  buttonSeason3Selected = false;
                  buttonSeason4Selected = false;
                });
              },
            ),
            CustomButton(
              width: 0.20,
              label: 'Spring',
              isSelected: buttonSeason2Selected,
              onPressed: () {
                CalculateGlobalWidget.of(context).setButtonActivity(true);
                setState(() {
                  buttonSeason1Selected = false;
                  buttonSeason2Selected = true;
                  buttonSeason3Selected = false;
                  buttonSeason4Selected = false;
                });
              },
            ),
            CustomButton(
              width: 0.20,
              label: 'Summer',
              isSelected: buttonSeason3Selected,
              onPressed: () {
                CalculateGlobalWidget.of(context).setButtonActivity(true);
                setState(() {
                  buttonSeason1Selected = false;
                  buttonSeason2Selected = false;
                  buttonSeason3Selected = true;
                  buttonSeason4Selected = false;
                });
              },
            ),
            CustomButton(
              width: 0.20,
              label: 'Autumn',
              isSelected: buttonSeason4Selected,
              onPressed: () {
                CalculateGlobalWidget.of(context).setButtonActivity(true);
                setState(() {
                  buttonSeason1Selected = false;
                  buttonSeason2Selected = false;
                  buttonSeason3Selected = false;
                  buttonSeason4Selected = true;
                });
              },
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final double width;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomButton({
    required this.width,
    required this.label,
    required this.isSelected,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
        width: MediaQuery.of(context).size.width * width,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color:
              isSelected ? const Color.fromRGBO(252, 108, 76, 1) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.09),
              offset: Offset(1, 3),
              blurRadius: 9,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
