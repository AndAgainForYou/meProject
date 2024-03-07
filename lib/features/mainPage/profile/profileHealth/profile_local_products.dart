import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';

class ProfileLocalProductsWidget extends StatefulWidget {
  const ProfileLocalProductsWidget({super.key});

  @override
  State<ProfileLocalProductsWidget> createState() =>
      _ProfileLocalProductsWidgetState();
}

class _ProfileLocalProductsWidgetState
    extends State<ProfileLocalProductsWidget> {
  bool buttonSeason1Selected = false; //Season
  bool buttonSeason2Selected = false;
  bool buttonSeason3Selected = false;
  bool buttonSeason4Selected = false;

  String selectedRegion = '';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Region", child: Text("Region")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }

  Map<String, dynamic> updateProfileData = {};
  bool _isButtonActive = false;

  void isSelectedAll() {
    if ((buttonSeason1Selected ||
            buttonSeason2Selected ||
            buttonSeason3Selected ||
            buttonSeason4Selected) &&
        selectedRegion.isNotEmpty) {
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
                          updateProfileData['region'] = selectedRegion;
                          isSelectedAll();
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
                      updateProfileData['season'] = 'Winter';
                      isSelectedAll();
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
                      updateProfileData['season'] = 'Spring';
                      isSelectedAll();
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
                      updateProfileData['season'] = 'Summer';
                      isSelectedAll();
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
                      updateProfileData['season'] = 'Autumn';
                      isSelectedAll();
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
