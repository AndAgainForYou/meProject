import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/mainPage/profile/profileHealth/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileCurrentDietWidget extends StatefulWidget {
  const ProfileCurrentDietWidget({Key? key}) : super(key: key);

  @override
  _ProfileCurrentDietWidgetState createState() =>
      _ProfileCurrentDietWidgetState();
}

class _ProfileCurrentDietWidgetState extends State<ProfileCurrentDietWidget> {
  List<String> titles = [
    'Mediterranean',
    'Keto',
    'Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Paleo',
  ];
  int? _selectedIndex;
  bool _isButtonActive = false;
  Map<String, dynamic> updateProfileData = {};
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 63),
                Text(
                  'Choose your current diet',
                  textAlign: TextAlign.center,
                  style: whiteTheme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return CustomListTile(
                        title: titles[index],
                        isChecked: _selectedIndex == index,
                        onTilePressed: (isChecked) {
                          setState(() {
                            _selectedIndex = isChecked ? index : null;
                            _isButtonActive = true;
                            updateProfileData['current_diet'] = titles[index];
                          });
                        },
                      );
                    },
                  ),
                ),
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
        ));
  }
}
