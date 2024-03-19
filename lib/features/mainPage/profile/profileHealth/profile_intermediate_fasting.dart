import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/mainPage/profile/profileHealth/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_fasting_days.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileIntermediateFastingWidget extends StatefulWidget {
  const ProfileIntermediateFastingWidget({super.key});

  @override
  State<ProfileIntermediateFastingWidget> createState() =>
      _ProfileIntermediateFastingWidgetState();
}

class _ProfileIntermediateFastingWidgetState
    extends State<ProfileIntermediateFastingWidget> {
  List<String> titles = [
    '16/8 Fasting (16 hours fasting, 8 hours eating)',
    '5:2 Fasting (5 days regular eating, 2 days reduced calories)',
  ];
  int? _selectedIndex;
  bool _isButtonActive = false;
  bool isCurrentPage = true;
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
            if (isCurrentPage) {
              if (state is ProfileIncludesDataState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileFastingDaysWidget(),
                  ),
                );
              }
              isCurrentPage = false;
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
                  'Intermediate Fasting',
                  textAlign: TextAlign.center,
                  style: whiteTheme.textTheme.bodyMedium,
                ),
                const Text(
                  'What is your eating type?',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return /* CustomListTile(
                        title: titles[index],
                        isChecked: _selectedIndex == index,
                        onTilePressed: (isChecked) {
                          setState(() {
                            if (isChecked) {
                              _selectedIndex = index;
                              _isButtonActive = true;
                              updateProfileData['tpds'] = titles[index];
                            } else {
                              _selectedIndex = null;
                              _isButtonActive = false;
                            }
                          });
                        },
                      ); */
                       CustomListTileWithRadio(
                        title: titles[index],
                        isChecked: _selectedIndex == index,
                        onTilePressed: (isChecked) {
                           setState(() {
                            if (isChecked) {
                              _selectedIndex = index;
                              _isButtonActive = true;
                              updateProfileData['tpds'] = titles[index];
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
                      'Save and Next',
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
        ));
  }
}
