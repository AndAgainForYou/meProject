import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/mainPage/profile/profileHealth/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileCurrentGoalsWidget extends StatefulWidget {
  const ProfileCurrentGoalsWidget({super.key});

  @override
  State<ProfileCurrentGoalsWidget> createState() =>
      _ProfileCurrentGoalsWidgetState();
}

class _ProfileCurrentGoalsWidgetState extends State<ProfileCurrentGoalsWidget> {
  List<String> titles = [
    "Gut Health",
    "Hydration",
    'Adapt to Changes',
    'Mood Stability',
    "Weight Management",
    'Hot Flash Management',
    'Cognitive function',
    'Muscle Mass Preservation',
    'Skin and Hair Health',
    'Insomnia and Sleep \nDisturbance Management',
    'Oral Health Management',
    'Cardiovascular Health',
    'Bone Health',
    'Vaginal Problems',
    'Urinary Problems',
    'High Blood Sugar levels',
    'Thyroid Health',
  ];
  int? _selectedIndex;
  List<bool> _isCheckedList = [];
  List<String> choosedTitles = [];
  bool _isButtonActive = false;
  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

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
                  Text(''),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          toolbarHeight: 90,
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
                  'Current Goals',
                  textAlign: TextAlign.center,
                  style: whiteTheme.textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 30,
                ),
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
                            choosedTitles.add(titles[index]);
                            _isCheckedList[index] = isChecked;
                            _isButtonActive = _isCheckedList.contains(true);
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
                                UpdateProfilePatchEvent(
                                    {'current_goals': choosedTitles}));
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
