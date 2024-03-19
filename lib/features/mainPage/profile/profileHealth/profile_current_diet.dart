import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
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
    'Fasting',
    'Mediterranean',
    'DASH Diet',
    'Keto',
    'Lacto-ovo vegetarian',
    'Ovo-vegetarian',
    'Lacto-vegetarian',
    'Vegan',
    'Pescatarian',
    'Gluten-Free',
    'Lactose-Free',
    'Paleo',
    'Anything/No specific \npreference',
  ];
  List<String?> subTitles = [
    null,
    null,
    null,
    null,
    'Eat dairy foods and eggs but not\nmeat, poultry or seafood',
    'Include eggs but avoid all other\nanimal foods, including dairy',
    'Eat dairy foods but exclude eggs,\nmeat, poultry and seafood',
    'Don’t eat any animal products\nincluding honey, dairy and eggs',
    'Eat fish and/or shellfish',
    null,
    null,
    null,
    null,
  ];
  int? _selectedIndex;
  List<bool> _isCheckedList = [];
  List<String> choosedTitles = [];
  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  bool _isButtonActive = false;
  Map<String, dynamic> updateProfileData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        appBar: AppBar(
          toolbarHeight: 90,
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
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 240, 242, 236),
          surfaceTintColor: Colors.transparent,
          title: Image.asset(
            'assets/images/logo_small.png',
            height: 32,
            width: 32,
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
                  'Choose your current diet',
                  textAlign: TextAlign.center,
                  style: whiteTheme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return CustomListTileWithRadio(
                        title: titles[index],
                        isChecked: _isCheckedList[index],
                        customStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                        subtitle: subTitles[index],
                        onTilePressed: (isChecked) {
                          setState(() {
                            _isCheckedList[index] = isChecked;
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
