import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';
import 'package:wheel_slider/wheel_slider.dart';

class CalculateLocalProductsWidget extends StatefulWidget {
  const CalculateLocalProductsWidget({Key? key}) : super(key: key);

  @override
  State<CalculateLocalProductsWidget> createState() =>
      _CalculateLocalProductsWidgetState();
}

class _CalculateLocalProductsWidgetState
    extends State<CalculateLocalProductsWidget> {
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

  void isButtonActive() {
    if (CalculateGlobalWidget.of(context).userModelBuilder.season != null &&
        CalculateGlobalWidget.of(context).userModelBuilder.region != null) {
      CalculateGlobalWidget.of(context).setButtonActivity(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
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
                      verticalListWidth: MediaQuery.of(context).size.width * 1,
                      listWidth: MediaQuery.of(context).size.width * 0.7,
                      perspective: 0.001,
                      totalCount: regionTitles.length,
                      initValue: _cInitValue,
                      scrollPhysics: const BouncingScrollPhysics(),
                      onValueChanged: (val) {
                        setState(() {
                          _cCurrentValue = val;
                          CalculateGlobalWidget.of(context)
                              .userModelBuilder
                              .region = regionTitles[_cCurrentValue];
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
                                  color: const Color.fromRGBO(164, 171, 155, 1),
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
                              CalculateGlobalWidget.of(context)
                                  .userModelBuilder
                                  .season = _selectedOptionsEmotions;
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
