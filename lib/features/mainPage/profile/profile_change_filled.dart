import 'package:flutter/material.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_activity_sport.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_alergic_list.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_chronic_diseases.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_cooking_chose.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_cousin_choose.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_current_diet.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_diversity_plan.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_eco_friendly_list.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_food_preferences.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_freq_sport.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_health_status_first.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_health_status_habits.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_health_status_second.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_health_status_third.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_height.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_local_products.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_medicaments.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_mental_health.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_nutrition_add.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_skin_beauty.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_supplements.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_weight.dart';
import 'package:platy/features/mainPage/profile/profileHealth/profile_weight_loss_slider.dart';

class ProfileChangeFilledPage extends StatefulWidget {
  const ProfileChangeFilledPage({super.key});

  @override
  State<ProfileChangeFilledPage> createState() =>
      _ProfileChangeFilledPageState();
}

class _ProfileChangeFilledPageState extends State<ProfileChangeFilledPage> {
  final List<String> elementsTitles = [
    'Height Status',
    'Weight Status',
    'Alegic list status',
    'Chronic Diseases status',
    'Sport Activity status',
    'Frequency of Sport status',
    'Weight Loss status',
    'Mental Health status',
    'Skin & Beauty status',
    'Food Preferences status',
    'Current Diet status',
    'Cooking Choose status',
    'Nutrition status',
    'Blood check-up status',
    'Urine check-up status',
    'Vitamin check-up status',
    'Habits status',
    'Supplements status',
    'Medicaments status',
    'Cousin List status',
    'Eco Friendly products status',
    'Local Products status',
    'Diversity Plan status',
  ];

  final List<Widget> elemWidget = [
    const ProfileHeightWidget(),
    const ProfileWeightWidget(),
    const ProfileAlergicListWidget(),
    const ProfileChronicDiseasesListWidget(),
    const ProfileActivitySportListWidget(),
    const ProfileFreqSportWidget(),
    const ProfileWeightLossSliderWidget(),
    const ProfileMentalHealthWidget(),
    const ProfileSkinAndBeautyWidget(),
    const ProfileFoodPreferencesWidget(),
    const ProfileCurrentDietWidget(),
    const ProfileCookingChoseWidget(),
    const ProfileNutritionAddWidget(),
    const ProfileHealthStatusFirstWidget(),
    const ProfileHealthStatusSecondWidget(),
    const ProfileHealthStatusThirdWidget(),
    const ProfileHealthStatusHabitsWidget(),
    const ProfileSupplementsListWidget(),
    const ProfileMedicamentsWidget(),
    const ProfileCousinListWidget(),
    const ProfileEcoFriendlyListWidget(),
    const ProfileLocalProductsWidget(),
    const ProfileDiversityPlanWidget(),
  ];

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
                  SizedBox(
                    width: 8,
                  ),
                  Text('Back')
                ]),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Сhange filled data',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Gilroy',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 4.0),
            child: IconButton(
                onPressed: () {},
                icon: const Text(
                  'Clear All',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(255, 87, 87, 1)),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, left: 10.0, right: 10.0, bottom: 100.0),
          child: Column(
            children: generateListWidgets(elementsTitles),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Container(
          height: 52.0,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              gradient: const LinearGradient(colors: [
                Color(0xFF59A7A7),
                Color(0xFFAFCD6D),
              ])),
          child: FloatingActionButton(
            heroTag: "MyFirstPage",
            splashColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Navigator.of(context).pop();
            },
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(50)),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> generateListWidgets(List<String> elements) {
    return List.generate(elements.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                    offset: Offset(1, 3),
                    blurRadius: 9,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${index + 1}. ',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          elements[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => elemWidget[index]),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(30, 26),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 4.0,
                          bottom: 4.0,
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Gilroy',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      );
    });
  }
}
