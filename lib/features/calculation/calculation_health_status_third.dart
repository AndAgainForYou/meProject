import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';

class CalculateHealthStatusThirdWidget extends StatefulWidget {
  const CalculateHealthStatusThirdWidget({super.key});

  @override
  State<CalculateHealthStatusThirdWidget> createState() =>
      _CalculateHealthStatusThirdWidgetState();
}

class _CalculateHealthStatusThirdWidgetState
    extends State<CalculateHealthStatusThirdWidget> {
  bool buttonD1Selected = false;
  bool buttonD2Selected = true;
  bool buttonD3Selected = false;

  bool buttonB1Selected = false;
  bool buttonB2Selected = true;
  bool buttonB3Selected = false;

  bool buttonCalcium1Selected = false;
  bool buttonCalcium2Selected = true;
  bool buttonCalcium3Selected = false;

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
          'Vitamin D',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              label: 'Sufficient',
              isSelected: buttonD1Selected,
              onPressed: () {
                setState(() {
                  buttonD1Selected = true;
                  buttonD2Selected = false;
                  buttonD3Selected = false;
                });
              },
            ),
            CustomButton(
              label: 'Insufficient',
              isSelected: buttonD2Selected,
              onPressed: () {
                setState(() {
                  buttonD1Selected = false;
                  buttonD2Selected = true;
                  buttonD3Selected = false;
                });
              },
            ),
            CustomButton(
              label: 'Deficient',
              isSelected: buttonD3Selected,
              onPressed: () {
                setState(() {
                  buttonD1Selected = false;
                  buttonD2Selected = false;
                  buttonD3Selected = true;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Vitamin B12',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              label: ' Low',
              isSelected: buttonB1Selected,
              onPressed: () {
                setState(() {
                  buttonB1Selected = true;
                  buttonB2Selected = false;
                  buttonB3Selected = false;
                });
              },
            ),
            CustomButton(
              label: 'Deficient',
              isSelected: buttonB2Selected,
              onPressed: () {
                setState(() {
                  buttonB1Selected = false;
                  buttonB2Selected = true;
                  buttonB3Selected = false;
                });
              },
            ),
            CustomButton(
              label: 'Normal',
              isSelected: buttonB3Selected,
              onPressed: () {
                setState(() {
                  buttonB1Selected = false;
                  buttonB2Selected = false;
                  buttonB3Selected = true;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Calcium',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              label: ' Low',
              isSelected: buttonCalcium1Selected,
              onPressed: () {
                setState(() {
                  buttonCalcium1Selected = true;
                  buttonCalcium2Selected = false;
                  buttonCalcium3Selected = false;
                });
              },
            ),
            CustomButton(
              label: 'Deficient',
              isSelected: buttonCalcium2Selected,
              onPressed: () {
                setState(() {
                  buttonCalcium1Selected = false;
                  buttonCalcium2Selected = true;
                  buttonCalcium3Selected = false;
                });
              },
            ),
            CustomButton(
              label: 'Normal',
              isSelected: buttonCalcium3Selected,
              onPressed: () {
                setState(() {
                  buttonCalcium1Selected = false;
                  buttonCalcium2Selected = false;
                  buttonCalcium3Selected = true;
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
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomButton({
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
        width: MediaQuery.of(context).size.width * 0.29,
        padding: const EdgeInsets.all(12),
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
