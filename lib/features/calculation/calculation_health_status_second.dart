import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';

class CalculateHealthStatusSecondWidget extends StatefulWidget {
  const CalculateHealthStatusSecondWidget({super.key});

  @override
  State<CalculateHealthStatusSecondWidget> createState() =>
      _CalculateHealthStatusSecondWidgetState();
}

class _CalculateHealthStatusSecondWidgetState
    extends State<CalculateHealthStatusSecondWidget> {
  bool buttonPH1Selected = false; //PH
  bool buttonPH2Selected = true;
  bool buttonPH3Selected = false;

  bool buttonElectrolyte1Selected = true; //Electrolyte
  bool buttonElectrolyte2Selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 63),
        const Center(
          child: Column(
            children: [
              Text(
                'Health status',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Add information from your last vitamin check-up',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'pH Levels',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              width: 0.29,
              label: 'Acidic',
              isSelected: buttonPH1Selected,
              onPressed: () {
                setState(() {
                  buttonPH1Selected = true;
                  buttonPH2Selected = false;
                  buttonPH3Selected = false;
                });
              },
            ),
            CustomButton(
              width: 0.29,
              label: 'Neutral',
              isSelected: buttonPH2Selected,
              onPressed: () {
                setState(() {
                  buttonPH1Selected = false;
                  buttonPH2Selected = true;
                  buttonPH3Selected = false;
                });
              },
            ),
            CustomButton(
              width: 0.29,
              label: 'Alkaline',
              isSelected: buttonPH3Selected,
              onPressed: () {
                setState(() {
                  buttonPH1Selected = false;
                  buttonPH2Selected = false;
                  buttonPH3Selected = true;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Electrolyte Balance',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              width: 0.44,
              label: 'Balanced',
              isSelected: buttonElectrolyte1Selected,
              onPressed: () {
                setState(() {
                  buttonElectrolyte1Selected = true;
                  buttonElectrolyte2Selected = false;
                });
              },
            ),
            CustomButton(
              width: 0.44,
              label: 'Imbalanced',
              isSelected: buttonElectrolyte2Selected,
              onPressed: () {
                setState(() {
                  buttonElectrolyte1Selected = false;
                  buttonElectrolyte2Selected = true;
                });
              },
            ),
          ],
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
            onPressed: () {
              CalculateGlobalWidget.of(context).pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
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
          borderRadius: BorderRadius.circular(50),
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
