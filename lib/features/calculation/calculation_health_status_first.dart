import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';

class CalculateHealthStatusFirstWidget extends StatefulWidget {
  const CalculateHealthStatusFirstWidget({super.key});

  @override
  State<CalculateHealthStatusFirstWidget> createState() =>
      _CalculateHealthStatusFirstWidgetState();
}

class _CalculateHealthStatusFirstWidgetState
    extends State<CalculateHealthStatusFirstWidget> {
  bool buttonCholesterol1Selected = false; //Cholesterol
  bool buttonCholesterol2Selected = false;
  bool buttonCholesterol3Selected = false;

  bool buttonBlood1Selected = false; //Blood
  bool buttonBlood2Selected = false;
  bool buttonBlood3Selected = false;

  bool buttonHemoglobin1Selected = false; //Hemoglobin
  bool buttonHemoglobin2Selected = false;

  bool buttonTriglycerides1Selected = false; //Triglycerides
  bool buttonTriglycerides2Selected = false;
  bool buttonTriglycerides3Selected = false;

  bool buttonIron1Selected = false; //Iron
  bool buttonIron2Selected = false;
  bool buttonIron3Selected = false;
  void checkToNext() {
    if ((buttonBlood1Selected ||
            buttonBlood2Selected ||
            buttonBlood3Selected) &&
        (buttonCholesterol1Selected ||
            buttonCholesterol2Selected ||
            buttonCholesterol3Selected) &&
        (buttonHemoglobin1Selected || buttonHemoglobin2Selected) &&
        (buttonIron1Selected || buttonIron2Selected || buttonIron3Selected) &&
        (buttonTriglycerides1Selected ||
            buttonTriglycerides2Selected ||
            buttonTriglycerides3Selected)) {
      CalculateGlobalWidget.of(context).setButtonActivity(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
            'Cholesterol Levels',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 0.29,
                label: ' Low',
                isSelected: buttonCholesterol1Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .cholesterol_level = 'Low';
                  setState(() {
                    buttonCholesterol1Selected = true;
                    buttonCholesterol2Selected = false;
                    buttonCholesterol3Selected = false;
                    checkToNext();
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'Normal',
                isSelected: buttonCholesterol2Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .cholesterol_level = 'Normal';
                  setState(() {
                    buttonCholesterol1Selected = false;
                    buttonCholesterol2Selected = true;
                    buttonCholesterol3Selected = false;
                    checkToNext();
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'High',
                isSelected: buttonCholesterol3Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .cholesterol_level = 'High';
                  setState(() {
                    buttonCholesterol1Selected = false;
                    buttonCholesterol2Selected = false;
                    buttonCholesterol3Selected = true;
                    checkToNext();
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Blood Glucose Levels',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 0.29,
                label: 'Normal',
                isSelected: buttonBlood1Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .blood_glucose_level = 'Normal';
                  setState(() {
                    buttonBlood1Selected = true;
                    buttonBlood2Selected = false;
                    buttonBlood3Selected = false;
                    checkToNext();
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'Pre-Diabetic',
                isSelected: buttonBlood2Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .blood_glucose_level = 'Pre-Diabetic';
                  setState(() {
                    buttonBlood1Selected = false;
                    buttonBlood2Selected = true;
                    buttonBlood3Selected = false;
                    checkToNext();
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'Diabetic',
                isSelected: buttonBlood3Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .blood_glucose_level = 'Diabetic';
                  setState(() {
                    buttonBlood1Selected = false;
                    buttonBlood2Selected = false;
                    buttonBlood3Selected = true;
                    checkToNext();
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Hemoglobin A1c',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 0.44,
                label: 'Normal',
                isSelected: buttonHemoglobin1Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .hemoglobin_level = 'Normal';
                  setState(() {
                    buttonHemoglobin1Selected = true;
                    buttonHemoglobin2Selected = false;
                    checkToNext();
                  });
                },
              ),
              CustomButton(
                width: 0.44,
                label: 'High',
                isSelected: buttonHemoglobin2Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .hemoglobin_level = 'High';
                  setState(() {
                    buttonHemoglobin1Selected = false;
                    buttonHemoglobin2Selected = true;
                    checkToNext();
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Triglycerides',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 0.29,
                label: ' Low',
                isSelected: buttonTriglycerides1Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .triglycerides_level = 'Low';
                  setState(() {
                    buttonTriglycerides1Selected = true;
                    buttonTriglycerides2Selected = false;
                    buttonTriglycerides3Selected = false;
                    checkToNext();
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'Normal',
                isSelected: buttonTriglycerides2Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .triglycerides_level = 'Normal';
                  setState(() {
                    buttonTriglycerides1Selected = false;
                    buttonTriglycerides2Selected = true;
                    buttonTriglycerides3Selected = false;
                    checkToNext();
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'High',
                isSelected: buttonTriglycerides3Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .triglycerides_level = 'High';
                  setState(() {
                    buttonTriglycerides1Selected = false;
                    buttonTriglycerides2Selected = false;
                    buttonTriglycerides3Selected = true;
                    checkToNext();
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Iron Levels',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: 0.29,
                label: ' Low',
                isSelected: buttonIron1Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .iron_level = 'Low';
                  setState(() {
                    buttonIron1Selected = true;
                    buttonIron2Selected = false;
                    buttonIron3Selected = false;
                    checkToNext();
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'Normal',
                isSelected: buttonIron2Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .iron_level = 'Normal';
                  setState(() {
                    buttonIron1Selected = false;
                    buttonIron2Selected = true;
                    buttonIron3Selected = false;
                    checkToNext();
                  });
                },
              ),
              CustomButton(
                width: 0.29,
                label: 'High',
                isSelected: buttonIron3Selected,
                onPressed: () {
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .iron_level = 'High';
                  setState(() {
                    buttonIron1Selected = false;
                    buttonIron2Selected = false;
                    buttonIron3Selected = true;
                    checkToNext();
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
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
