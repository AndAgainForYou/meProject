import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';
import 'package:wheel_slider/wheel_slider.dart';

class ProfileLocalProductsWidget extends StatefulWidget {
  const ProfileLocalProductsWidget({super.key});

  @override
  State<ProfileLocalProductsWidget> createState() =>
      _ProfileLocalProductsWidgetState();
}

class _ProfileLocalProductsWidgetState
    extends State<ProfileLocalProductsWidget> {
  Map<String, dynamic> updateProfileData = {};
  int? _selectedIndexEmotions;
  List<String> regionTitles = [
    'United States',
    'Ukraine',
    'United Kingdom',
    'United Arab Emirates',
    'Uzbekistan',
    'Uruguay',
    'Vanuatu',
  ];
  List<String> titles = [
    'Winter',
    'Spring',
    'Summer',
    'Autumn',
  ];
  List<String> titlesImages = [
    'winter',
    'spring',
    'summer',
    'autumn',
  ];
  String? _selectedOptionsEmotions;
  int _cInitValue = 1;
  int _cCurrentValue = 1;
  bool _isButtonActive = false;
  String? season;
  String? region;

  void isButtonActive() {
    if (season != null && region != null) {
      _isButtonActive = true;
    }
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
        leadingWidth: 90,
        toolbarHeight: 90,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Use local products',
                    textAlign: TextAlign.center,
                    style: whiteTheme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mention the region of living and season\nof the year',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Center(
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(196, 203, 185, 1),
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                      WheelSlider.customWidget(
                        animationDuration: const Duration(milliseconds: 400),
                        horizontal: false,
                        isInfinite: true,
                        verticalListHeight: 270,
                        verticalListWidth:
                            MediaQuery.of(context).size.width * 1,
                        listWidth: MediaQuery.of(context).size.width * 0.7,
                        perspective: 0.001,
                        totalCount: regionTitles.length,
                        initValue: _cInitValue,
                        scrollPhysics: const BouncingScrollPhysics(),
                        onValueChanged: (val) {
                          setState(() {
                            _cCurrentValue = val;
                            region = regionTitles[_cCurrentValue];
                            isButtonActive();
                          });
                        },
                        hapticFeedbackType: HapticFeedbackType.vibrate,
                        showPointer: false,
                        itemSize: 70,
                        children: List.generate(
                          regionTitles.length,
                          (index) => Center(
                            child: Text(
                              regionTitles[index],
                              textAlign: TextAlign.center,
                              style: index == _cCurrentValue
                                  ? const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    )
                                  : const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 24,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Season of the year',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 200, // Set a fixed height for the ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            border: _selectedIndexEmotions == index
                                ? Border.all(
                                    color:
                                        const Color.fromRGBO(164, 171, 155, 1),
                                    width: 2,
                                  )
                                : Border.all(
                                    color: Colors.transparent,
                                    width: 2,
                                  ),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                _selectedIndexEmotions = index;
                                _selectedOptionsEmotions = titles[index];
                                season = _selectedOptionsEmotions;
                                isButtonActive();
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/${titlesImages[index]}.png',
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  titles[index],
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                                      {'season': season, 'region': region}));
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
        ),
      ),
    );
  }
}
