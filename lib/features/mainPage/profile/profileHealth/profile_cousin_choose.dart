import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/custom_list_tile_image.dart';
import 'package:platy/features/mainPage/profile/profileHealth/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileCousinListWidget extends StatefulWidget {
  const ProfileCousinListWidget({Key? key}) : super(key: key);

  @override
  _ProfileCousinListWidgetState createState() =>
      _ProfileCousinListWidgetState();
}

class _ProfileCousinListWidgetState extends State<ProfileCousinListWidget> {
  List<String> titles = [
    'Italian Cuisine',
    'French Cuisine',
    'Chinese Cuisine',
    'Japanese Cuisine',
    'Mexican Cuisine',
    'Indian Cuisine',
    'Mediterranean Cuisine',
    'Home style dinner',
  ];
  List<String> imageTitles = [
    'italian',
    'french',
    'chinese',
    'japanese',
    'mexican',
    'indian',
    'mediterranean',
    'home-food',
  ];
  List<bool> _isCheckedList = [];
  List<String> choosedTitles = [];
  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  bool _isButtonActive = false;

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
                'World cuisine',
                textAlign: TextAlign.center,
                style: whiteTheme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 14),
              const Text(
                'Choose the ones below',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return CustomListTileWithImage(
                      title: titles[index],
                      isChecked: _isCheckedList[index],
                      imageName: imageTitles[index],
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
                                  {'outside_eating_cuisine': choosedTitles}));
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
