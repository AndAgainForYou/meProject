import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/mainPage/profile/profileHealth/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileSkinAndBeautyWidget extends StatefulWidget {
  const ProfileSkinAndBeautyWidget({super.key});

  @override
  State<ProfileSkinAndBeautyWidget> createState() =>
      _ProfileSkinAndBeautyWidgetState();
}

class _ProfileSkinAndBeautyWidgetState
    extends State<ProfileSkinAndBeautyWidget> {
  List<String> titles = [
    'Reduce aging effects',
    'Reduce Spider Veins and\nBroken Blood Vessels',
    'Improve Hair Health',
    'Reduce skin sensitivity',
    'Reduce Dry Skin Effect',
    'Reduce Acne',
    'Reduce Hair Loss',
    'Improve Hair Health',
  ];
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
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: IconButton(
            icon: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back),
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
                'Skin and Beauty',
                textAlign: TextAlign.center,
                style: whiteTheme.textTheme.bodyMedium,
              ),
              const Text(
                'Select a target',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return /* CustomListTile(
                      title: titles[index],
                      isChecked: _isCheckedList[index],
                      onTilePressed: (isChecked) {
                        setState(() {
                          choosedTitles.add(titles[index]);
                          _isButtonActive = true;
                          _isCheckedList[index] = isChecked;
                        });
                      },
                    ); */

                        CustomListTileWithRadio(
                      title: titles[index],
                      isChecked: _isCheckedList[index],
                      customStyle: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      onTilePressed: (isChecked) {
                        setState(() {
                          choosedTitles.add(titles[index]);
                          _isButtonActive = true;
                          _isCheckedList[index] = isChecked;
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
                                  {'beauty_goals': choosedTitles}));
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
