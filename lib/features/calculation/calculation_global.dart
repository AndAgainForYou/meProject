import 'package:flutter/material.dart';
import 'package:platy/features/calculation/Calculation_home_eating_calendar.dart';
import 'package:platy/features/calculation/calculation_activity_sport.dart';
import 'package:platy/features/calculation/calculation_age.dart';
import 'package:platy/features/calculation/calculation_alergic_list.dart';
import 'package:platy/features/calculation/calculation_chronic_diseases.dart';
import 'package:platy/features/calculation/calculation_cooking_ask.dart';
import 'package:platy/features/calculation/calculation_cooking_chose.dart';
import 'package:platy/features/calculation/calculation_cousin_choose.dart';
import 'package:platy/features/calculation/calculation_current_diet.dart';
import 'package:platy/features/calculation/calculation_delivery.dart';
import 'package:platy/features/calculation/calculation_delivery_qa.dart';
import 'package:platy/features/calculation/calculation_diversity_plan.dart';
import 'package:platy/features/calculation/calculation_eco_friendly_list.dart';
import 'package:platy/features/calculation/calculation_fifth_tpd.dart';
import 'package:platy/features/calculation/calculation_first_tpd.dart';
import 'package:platy/features/calculation/calculation_food_preferences.dart';
import 'package:platy/features/calculation/calculation_fasting_days.dart';
import 'package:platy/features/calculation/calculation_fourth_tpd.dart';
import 'package:platy/features/calculation/calculation_freq_sport.dart';
import 'package:platy/features/calculation/calculation_gender.dart';
import 'package:platy/features/calculation/calculation_global_data.dart';
import 'package:platy/features/calculation/calculation_goals.dart';
import 'package:platy/features/calculation/calculation_health_goals.dart';
import 'package:platy/features/calculation/calculation_health_status_first.dart';
import 'package:platy/features/calculation/calculation_health_status_habits.dart';
import 'package:platy/features/calculation/calculation_health_status_second.dart';
import 'package:platy/features/calculation/calculation_health_status_third.dart';
import 'package:platy/features/calculation/calculation_height.dart';
import 'package:platy/features/calculation/calculation_home_eating_ask.dart';
import 'package:platy/features/calculation/calculation_intermediate_fasting.dart';
import 'package:platy/features/calculation/calculation_local_products.dart';
import 'package:platy/features/calculation/calculation_medicaments.dart';
import 'package:platy/features/calculation/calculation_medicaments_qa.dart';
import 'package:platy/features/calculation/calculation_mental_health.dart';
import 'package:platy/features/calculation/calculation_nutrition_add.dart';
import 'package:platy/features/calculation/calculation_skin_beauty.dart';
import 'package:platy/features/calculation/calculation_specific_diet.dart';
import 'package:platy/features/calculation/calculation_sport_nutrition.dart';
import 'package:platy/features/calculation/calculation_sports_competition.dart';
import 'package:platy/features/calculation/calculation_supplements.dart';
import 'package:platy/features/calculation/calculation_supplements_qa.dart';
import 'package:platy/features/calculation/calculation_third_tpd.dart';
import 'package:platy/features/calculation/calculation_user_name.dart';
import 'package:platy/features/calculation/calculation_weight.dart';
import 'package:platy/features/calculation/calculation_weight_loss.dart';
import 'package:platy/features/calculation/calculation_weight_loss_slider.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateGlobalWidget extends StatefulWidget {
  const CalculateGlobalWidget({Key? key}) : super(key: key);
  static _CalculateGlobalWidgetState of(
    BuildContext context, {
    bool rootNavigator = false,
  }) {
    _CalculateGlobalWidgetState? navigator;
    if (context is StatefulElement &&
        context.state is _CalculateGlobalWidgetState) {
      navigator = context.state as _CalculateGlobalWidgetState;
    }
    if (rootNavigator) {
      navigator =
          context.findRootAncestorStateOfType<_CalculateGlobalWidgetState>() ??
              navigator;
    } else {
      navigator = navigator ??
          context.findAncestorStateOfType<_CalculateGlobalWidgetState>();
    }
    return navigator!;
  }

  @override
  _CalculateGlobalWidgetState createState() => _CalculateGlobalWidgetState();
}

class _CalculateGlobalWidgetState extends State<CalculateGlobalWidget> {
  final pageNotifier = ValueNotifier<int>(1);
  final pageController = PageController();
  final ValueNotifier<bool> showSkipButtonNotifier = ValueNotifier<bool>(false);

  void saveAnswer(String question, dynamic answer) {
    GlobalData().answers[question] = answer;
    setState(() {});
  }

  void pageListener() {
    pageNotifier.value = pageController.page!.round() + 1;
    bool isSkipButtonWidget = false;
    if (pageNotifier.value == 6 ||
        pageNotifier.value == 7 ||
        pageNotifier.value == 8) {
      isSkipButtonWidget = true;
    }
    showSkipButtonNotifier.value = isSkipButtonWidget;
  }

  @override
  void initState() {
    pageController.addListener(pageListener);
    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(pageListener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (pageController.page?.round() == 0) {
                    Navigator.pop(context);
                  } else {
                    FocusScope.of(context).unfocus();
                    pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  }
                },
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: const Image(
          image: AssetImage('assets/images/logo_small.png'),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: showSkipButtonNotifier,
            builder: (context, showSkipButton, child) {
              return showSkipButton
                  ? Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: ElevatedButton(
                        
                        onPressed: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(const Size.fromHeight(31.0),),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.blue),
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Questions:',
                    textAlign: TextAlign.left,
                    style: whiteTheme.textTheme.titleSmall),
                const SizedBox(width: 8),
                ValueListenableBuilder(
                    valueListenable: pageNotifier,
                    builder: (context, page, child) {
                      return Text('$page/31',
                          textAlign: TextAlign.left,
                          style: whiteTheme.textTheme.bodySmall);
                    }),
              ],
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  const CalculateNameWidget(),
                  const CalculateGenderWidget(),
                  const CalculateAgeWidget(),
                  const CalculateHeightWidget(),
                  const CalculateWeightWidget(),
                  const CalculateAlergicListWidget(),
                  const CalculateChronicDiseasesListWidget(),
                  const CalculateActivitySportListWidget(),
                  const CalculateSportCompetitionWidget(),
                  const CalculateImpGoalsListWidget(),
                  const CalculateFreqSportWidget(),
                  const CalculateHealthGoalsWidget(),
                  if (GlobalData().answers['health_goals'] ==
                      'Weight loss') ...[
                    const CalculateWeightLossWidget(), //weight loss widget
                    const CalculateWeightLossSliderWidget(), //weight loss slider
                  ] else if (GlobalData().answers['health_goals'] ==
                      'Mental Health') ...[
                    const CalculateMentalHealthWidget(), //mental health widget
                  ] else if (GlobalData().answers['health_goals'] ==
                      'Skin and Beauty') ...[
                    const CalculateSkinAndBeautyWidget(), //skin and beauty list widget
                  ],

                  const CalculateFoodPreferencesWidget(),
                  if (GlobalData().answers['food_preferences'] ==
                      '1-2 TPD') ...[
                    const CalculateFirstTPDWidget(),
                  ] else if (GlobalData().answers['food_preferences'] ==
                      '3 TPD') ...[
                    const CalculateThirdTPDWidget(),
                  ] else if (GlobalData().answers['food_preferences'] ==
                      '4 TPD') ...[
                    const CalculateFourthTPDWidget(),
                  ] else if (GlobalData().answers['food_preferences'] ==
                      '5 TPD') ...[
                    const CalculateFifthTPDWidget(),
                  ] else if (GlobalData().answers['food_preferences'] ==
                      'Intermediate Fasting') ...[
                    const CalculateIntermediateFastingWidget(),
                    const CalculateFastingDaysWidget(),
                  ],

                  const CalculateSpecificDietWidget(),
                  if (GlobalData().answers['specific_diet'] == 'Yes') ...[
                    const CalculateCurrentDietWidget(),
                  ],

                  const CalculateCookingAskWidget(),
                  if (GlobalData().answers['coocking_ask'] == 'Yes') ...[
                    const CalculateCookingChoseWidget(),
                  ],

                  const CalculateSportNutritionWidget(),
                  if (GlobalData().answers['nutrition_ask'] == 'Yes') ...[
                    const CalculateNutritionAddWidget(),
                  ],

                  const CalculateHealthStatusFirstWidget(), // plat-21 pages
                  const CalculateHealthStatusSecondWidget(), // plat-21 pages
                  const CalculateHealthStatusThirdWidget(), // plat-21 pages
                  const CalculateHealthStatusHabitsWidget(), // plat-21 pages

                  const CalculateSupplementsQAWidget(),
                  if (GlobalData().answers['supplements_ask'] == 'Yes') ...[
                    const CalculateSupplementsListWidget(),
                  ],

                  const CalculateMedicamentsQAWidget(),
                  if (GlobalData().answers['medicaments_ask'] == 'Yes') ...[
                    const CalculateMedicamentsWidget(),
                  ],

                  const CalculateHomeEatingAskWidget(),
                  if (GlobalData().answers['home_eating_ask'] == 'Yes') ...[
                    const CalculateHomeEatingCalendarWidget(),
                  ],

                  const CalculateCousinListWidget(),
                  const CalculateDeliveryQAWidget(),
                  if (GlobalData().answers['delivery_ask'] == 'Yes') ...[
                    const CalculateDeliveryListWidget(),
                  ],

                  const CalculateEcoFriendlyListWidget(),
                  const CalculateLocalProductsWidget(),
                  const CalculateDiversityPlanWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
