import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/mainPage/profile/profileHealth/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_fifth_tpd.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_first_tpd.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_fourth_tpd.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_intermediate_fasting.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_third_tpd.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileFoodPreferencesWidget extends StatefulWidget {
  const ProfileFoodPreferencesWidget({Key? key}) : super(key: key);

  @override
  _ProfileFoodPreferencesWidgetState createState() =>
      _ProfileFoodPreferencesWidgetState();
}

class _ProfileFoodPreferencesWidgetState
    extends State<ProfileFoodPreferencesWidget> {
  List<String> titles = [
    '1-2 TPD',
    '3 TPD',
    '4 TPD',
    '5 TPD',
    'Only snacks',
    'Intermediate Fasting',
  ];
  bool isCurrentPage = true;
  int? _selectedIndex;
  Map<String, dynamic> updateProfileData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
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
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        surfaceTintColor: Colors.transparent,
        title: Image.asset('assets/images/logo_small.png',
          height: 32,
          width: 32,),
      ),
      body: BlocListener<PlatyBloc, PlatyBlocState>(
        listener: (context, state) {
          if (state is ProfileIncludesDataState) {
            if (isCurrentPage) {
              if (updateProfileData['tpd_count'] == '1-2 TPD') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileFirstTPDWidget()));
              } else if (updateProfileData['tpd_count'] == '3 TPD') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileThirdTPDWidget()));
              } else if (updateProfileData['tpd_count'] == '4 TPD') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileFourthTPDWidget()));
              } else if (updateProfileData['tpd_count'] == '5 TPD') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileFifthTPDWidget()));
              } else if (updateProfileData['tpd_count'] ==
                  'Intermediate Fasting') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProfileIntermediateFastingWidget()));
              } else {
                Navigator.of(context).pop();
              }
              isCurrentPage = false;
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 63),
              Text(
                'Food Preferences',
                textAlign: TextAlign.center,
                style: whiteTheme.textTheme.bodyMedium,
              ),
              const Text(
                'How often do you prefer to eat?',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return /* CustomListTile(
                      title: titles[index],
                      isChecked: _selectedIndex == index,
                      onTilePressed: (isChecked) {
                        setState(() {
                          _selectedIndex = isChecked ? index : null;
                          updateProfileData['tpd_count'] = titles[index];
                          print(updateProfileData['tpd_count']);
                        });
                      },
                    ); */
                     CustomListTileWithRadio(
                        title: titles[index],
                        isChecked: _selectedIndex == index,
                        onTilePressed: (isChecked) {
                           setState(() {
                          _selectedIndex = isChecked ? index : null;
                          updateProfileData['tpd_count'] = titles[index];
                          print(updateProfileData['tpd_count']);
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
                  onPressed: () {
                    if (updateProfileData['tpd_count'] == 'Only snacks') {
                      updateProfileData['tpds'] = [''];
                    }
                    BlocProvider.of<PlatyBloc>(context)
                        .add(UpdateProfilePatchEvent(updateProfileData));
                  },
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
