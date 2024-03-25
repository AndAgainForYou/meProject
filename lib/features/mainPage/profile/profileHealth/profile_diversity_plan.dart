import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileDiversityPlanWidget extends StatefulWidget {
  const ProfileDiversityPlanWidget({Key? key}) : super(key: key);
  @override
  _ProfileDiversityPlanWidgetState createState() =>
      _ProfileDiversityPlanWidgetState();
}

class _ProfileDiversityPlanWidgetState
    extends State<ProfileDiversityPlanWidget> {
  List<String> titles = [
    'Each new day new meal plan',
    'New meal plan each second day',
    'Same meal plan Mo-Fr and diverse plan for Sa-So',
  ];
  bool _isButtonActive = false;
  int? _selectedIndex;
  Map<String, dynamic> updateProfileData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        leading: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: IconButton(
            icon: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back),
                SizedBox(width: 8),
                Text(''),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        toolbarHeight: 90,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: Image.asset(
          'assets/images/logo_small.png',
          width: 32,
          height: 32,
        ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Diversity of the plan',
                textAlign: TextAlign.center,
                style: whiteTheme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 14),
              const Text(
                'How often do you want to cook?',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return CustomListTileWithRadio(
                      title: titles[index],
                      isChecked: _selectedIndex == index,
                      customStyle: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      onTilePressed: (isChecked) {
                        setState(() {
                          if (isChecked) {
                            _selectedIndex = index;
                            updateProfileData['diversity'] = titles[index];
                            _isButtonActive = true;
                          } else {
                            _selectedIndex = null;
                            _isButtonActive = false;
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              Container(
                height: 54.0,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromRGBO(164, 171, 155, 1),
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
