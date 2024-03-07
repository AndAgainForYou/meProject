import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';

class ProfileHealthStatusThirdWidget extends StatefulWidget {
  const ProfileHealthStatusThirdWidget({super.key});

  @override
  State<ProfileHealthStatusThirdWidget> createState() =>
      _ProfileHealthStatusThirdWidgetState();
}

class _ProfileHealthStatusThirdWidgetState
    extends State<ProfileHealthStatusThirdWidget> {
  bool buttonD1Selected = false;
  bool buttonD2Selected = false;
  bool buttonD3Selected = false;

  bool buttonB1Selected = false;
  bool buttonB2Selected = false;
  bool buttonB3Selected = false;

  bool buttonCalcium1Selected = false;
  bool buttonCalcium2Selected = false;
  bool buttonCalcium3Selected = false;

  bool _isButtonActive = false;
  Map<String, dynamic> updateProfileData = {};

  void checkToNext() {
    if ((buttonD1Selected || buttonD2Selected || buttonD3Selected) &&
        (buttonB1Selected || buttonB2Selected || buttonB3Selected) &&
        (buttonCalcium1Selected ||
            buttonCalcium2Selected ||
            buttonCalcium3Selected)) {
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
                      updateProfileData['vitamin_D_status'] = 'Sufficient';
                      setState(() {
                        buttonD1Selected = true;
                        buttonD2Selected = false;
                        buttonD3Selected = false;
                        checkToNext();
                      });
                    },
                  ),
                  CustomButton(
                    label: 'Insufficient',
                    isSelected: buttonD2Selected,
                    onPressed: () {
                      updateProfileData['vitamin_D_status'] = 'Insufficient';
                      setState(() {
                        buttonD1Selected = false;
                        buttonD2Selected = true;
                        buttonD3Selected = false;
                        checkToNext();
                      });
                    },
                  ),
                  CustomButton(
                    label: 'Deficient',
                    isSelected: buttonD3Selected,
                    onPressed: () {
                      updateProfileData['vitamin_D_status'] = 'Deficient';
                      setState(() {
                        buttonD1Selected = false;
                        buttonD2Selected = false;
                        buttonD3Selected = true;
                        checkToNext();
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
                      updateProfileData['vitamin_B12_status'] = 'Low';
                      setState(() {
                        buttonB1Selected = true;
                        buttonB2Selected = false;
                        buttonB3Selected = false;
                        checkToNext();
                      });
                    },
                  ),
                  CustomButton(
                    label: 'Deficient',
                    isSelected: buttonB2Selected,
                    onPressed: () {
                      updateProfileData['vitamin_B12_status'] = 'Deficient';
                      setState(() {
                        buttonB1Selected = false;
                        buttonB2Selected = true;
                        buttonB3Selected = false;
                        checkToNext();
                      });
                    },
                  ),
                  CustomButton(
                    label: 'Normal',
                    isSelected: buttonB3Selected,
                    onPressed: () {
                      updateProfileData['vitamin_B12_status'] = 'Normal';
                      setState(() {
                        buttonB1Selected = false;
                        buttonB2Selected = false;
                        buttonB3Selected = true;
                        checkToNext();
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
                    label: 'Adequate',
                    isSelected: buttonCalcium1Selected,
                    onPressed: () {
                      updateProfileData['calcium_status'] = 'Adequate';
                      setState(() {
                        buttonCalcium1Selected = true;
                        buttonCalcium2Selected = false;
                        buttonCalcium3Selected = false;
                        checkToNext();
                      });
                    },
                  ),
                  CustomButton(
                    label: 'Insufficient',
                    isSelected: buttonCalcium2Selected,
                    onPressed: () {
                      updateProfileData['calcium_status'] = 'Insufficient';
                      setState(() {
                        buttonCalcium1Selected = false;
                        buttonCalcium2Selected = true;
                        buttonCalcium3Selected = false;
                        checkToNext();
                      });
                    },
                  ),
                  CustomButton(
                    label: 'Deficient',
                    isSelected: buttonCalcium3Selected,
                    onPressed: () {
                      updateProfileData['calcium_status'] = 'Deficient';
                      setState(() {
                        buttonCalcium1Selected = false;
                        buttonCalcium2Selected = false;
                        buttonCalcium3Selected = true;
                        checkToNext();
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
                  onPressed: _isButtonActive
                      ? () {
                          BlocProvider.of<PlatyBloc>(context)
                              .add(UpdateProfilePatchEvent(updateProfileData));
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
