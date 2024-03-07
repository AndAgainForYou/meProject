import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';

class ProfileHealthStatusFirstWidget extends StatefulWidget {
  const ProfileHealthStatusFirstWidget({super.key});

  @override
  State<ProfileHealthStatusFirstWidget> createState() =>
      _ProfileHealthStatusFirstWidgetState();
}

class _ProfileHealthStatusFirstWidgetState
    extends State<ProfileHealthStatusFirstWidget> {
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

  Map<String, dynamic> updateProfileData = {};
  bool _isButtonActive = false;

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
      _isButtonActive = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: IconButton(
            icon: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back),
                SizedBox(width: 8),
                Text('Back'),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Image.asset('assets/images/logo_small.png'),
      ),
      body: BlocListener<PlatyBloc, PlatyBlocState>(
        listener: (context, state) {
          if (state is ProfileIncludesDataState) {
            Navigator.of(context).pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: SingleChildScrollView(
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
                        'Add information from your last blood check-up',
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
                        updateProfileData['cholesterol_level'] = 'Low';
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
                        updateProfileData['cholesterol_level'] = 'Normal';
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
                        updateProfileData['cholesterol_level'] = 'High';
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
                        updateProfileData['blood_glucose_level'] = 'Normal';
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
                        updateProfileData['blood_glucose_level'] =
                            'Pre-diabetic';
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
                        updateProfileData['blood_glucose_level'] = 'Diabetic';
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
                        updateProfileData['hemoglobin_level'] = 'Normal';
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
                        updateProfileData['hemoglobin_level'] = 'High';
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
                        updateProfileData['triglycerides_level'] = 'Low';
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
                        updateProfileData['triglycerides_level'] = 'Normal';
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
                        updateProfileData['triglycerides_level'] = 'High';
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
                        updateProfileData['iron_level'] = 'Low';
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
                        updateProfileData['iron_level'] = 'Normal';
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
                        updateProfileData['iron_level'] = 'High';
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
                            BlocProvider.of<PlatyBloc>(context).add(
                                UpdateProfilePatchEvent(updateProfileData));
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
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
