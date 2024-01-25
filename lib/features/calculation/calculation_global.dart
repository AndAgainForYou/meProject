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
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
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
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.white,
                            fontSize: 14,
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
                      return Text('$page/39',
                          textAlign: TextAlign.left,
                          style: whiteTheme.textTheme.bodySmall);
                    }),
              ],
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: const [
                  CalculateNameWidget(),
                  CalculateGenderWidget(),
                  CalculateAgeWidget(),
                  CalculateHeightWidget(),
                  CalculateWeightWidget(),
                  CalculateAlergicListWidget(),
                  CalculateChronicDiseasesListWidget(),
                  CalculateActivitySportListWidget(),
                  CalculateSportCompetitionWidget(),
                  CalculateImpGoalsListWidget(),
                  CalculateFreqSportWidget(),
                  CalculateHealthGoalsWidget(),
                  CalculateWeightLossWidget(), //weight loss widget
                  CalculateWeightLossSliderWidget(), //weight loss slider
                  CalculateMentalHealthWidget(), //mental health widget
                  CalculateSkinAndBeautyWidget(), //skin and beauty list widget
                  CalculateFoodPreferencesWidget(),
                  CalculateFirstTPDWidget(),
                  CalculateThirdTPDWidget(),
                  CalculateFourthTPDWidget(),
                  CalculateFifthTPDWidget(),
                  CalculateIntermediateFastingWidget(),
                  CalculateFastingDaysWidget(),
                  CalculateSpecificDietWidget(),
                  CalculateCurrentDietWidget(),

                  CalculateCookingAskWidget(), //plat-19 pages
                  CalculateCookingChoseWidget(), //plat-19 pages

                  CalculateSportNutritionWidget(),
                  CalculateNutritionAddWidget(),
                  CalculateHealthStatusFirstWidget(), // plat-21 pages
                  CalculateHealthStatusSecondWidget(), // plat-21 pages
                  CalculateHealthStatusThirdWidget(), // plat-21 pages
                  CalculateHealthStatusHabitsWidget(), // plat-21 pages

                  CalculateSupplementsQAWidget(),
                  CalculateSupplementsListWidget(),

                  CalculateMedicamentsQAWidget(),
                  CalculateMedicamentsWidget(),

                  CalculateHomeEatingAskWidget(),
                  CalculateHomeEatingCalendarWidget(),

                  CalculateCousinListWidget(),

                  CalculateDeliveryQAWidget(),
                  CalculateDeliveryListWidget(),

                  CalculateEcoFriendlyListWidget(),
                  CalculateLocalProductsWidget(),

                  CalculateDiversityPlanWidget(),
                ],
              ),
            ),
            // кнопка
          ],
        ),
      ),
    );
  }
}
