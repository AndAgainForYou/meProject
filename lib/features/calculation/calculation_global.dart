import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/Calculation_home_eating_calendar.dart';
import 'package:platy/features/calculation/calculation_age.dart';
import 'package:platy/features/calculation/calculation_alergic_list.dart';
import 'package:platy/features/calculation/calculation_blood_check_qa%20copy.dart';
import 'package:platy/features/calculation/calculation_bones_check.dart';
import 'package:platy/features/calculation/calculation_chronic_diseases.dart';
import 'package:platy/features/calculation/calculation_cooking_ask.dart';
import 'package:platy/features/calculation/calculation_cooking_chose.dart';
import 'package:platy/features/calculation/calculation_cousin_choose.dart';
import 'package:platy/features/calculation/calculation_current_diet.dart';
import 'package:platy/features/calculation/calculation_current_goals.dart';
import 'package:platy/features/calculation/calculation_current_symptoms.dart';
import 'package:platy/features/calculation/calculation_delivery.dart';
import 'package:platy/features/calculation/calculation_delivery_qa.dart';
import 'package:platy/features/calculation/calculation_digestive_health.dart';
import 'package:platy/features/calculation/calculation_diversity_plan.dart';
import 'package:platy/features/calculation/calculation_eco_friendly_list.dart';
import 'package:platy/features/calculation/calculation_emotions.dart';
import 'package:platy/features/calculation/calculation_fifth_tpd.dart';
import 'package:platy/features/calculation/calculation_first_tpd.dart';
import 'package:platy/features/calculation/calculation_food_preferences.dart';
import 'package:platy/features/calculation/calculation_fasting_days.dart';
import 'package:platy/features/calculation/calculation_fourth_tpd.dart';
import 'package:platy/features/calculation/calculation_freq_sport.dart';
import 'package:platy/features/calculation/calculation_blood_check.dart';
import 'package:platy/features/calculation/calculation_health_status_habits.dart';
import 'package:platy/features/calculation/calculation_height.dart';
import 'package:platy/features/calculation/calculation_home_eating_ask.dart';
import 'package:platy/features/calculation/calculation_important_goals.dart';
import 'package:platy/features/calculation/calculation_intermediate_fasting.dart';
import 'package:platy/features/calculation/calculation_local_products.dart';
import 'package:platy/features/calculation/calculation_medicaments.dart';
import 'package:platy/features/calculation/calculation_medicaments_qa.dart';
import 'package:platy/features/calculation/calculation_nutrition_add.dart';
import 'package:platy/features/calculation/calculation_specific_diet.dart';
import 'package:platy/features/calculation/calculation_sport_nutrition.dart';
import 'package:platy/features/calculation/calculation_sugar_statements.dart';
import 'package:platy/features/calculation/calculation_supplements.dart';
import 'package:platy/features/calculation/calculation_supplements_qa.dart';
import 'package:platy/features/calculation/calculation_third_tpd.dart';
import 'package:platy/features/calculation/calculation_user_name.dart';
import 'package:platy/features/calculation/calculation_water_consumption.dart';
import 'package:platy/features/calculation/calculation_weight.dart';
import 'package:platy/features/calculation/repositories/models/update_user_model.dart';
import 'package:platy/features/mainPage/main_home_page.dart';

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
  bool _isButtonActive = false;
  bool _lastPage = false;
  final UpdateUserModelBuilder userModelBuilder = UpdateUserModelBuilder();
  int? indexHabitPage;
  void setButtonActivity(bool isActive) {
    setState(() {
      _isButtonActive = isActive;
    });
  }

  void checkIfHabbit(List<Widget> listWidgets) {
    for (int i = 0; i < listWidgets.length; i++) {
      if (listWidgets[i] is CalculateHealthStatusHabitsWidget) {
        setState(() {
          indexHabitPage = i + 1;
        });
        print(indexHabitPage);
        break;
      }
    }
  }

  void pageListener() {
    pageNotifier.value = pageController.page!.round() + 1;
    bool isSkipButtonWidget = false;
    if (pageNotifier.value == 5 ||
        pageNotifier.value == 6 ||
        pageNotifier.value == indexHabitPage) {
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
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
    List<Widget> lisWidgets = [
      const CalculateNameWidget(),
      const CalculateAgeWidget(),
      const CalculateHeightWidget(),
      const CalculateWeightWidget(),
      const CalculateAlergicListWidget(),
      const CalculateChronicDiseasesListWidget(),
      const CalculateBloodQAWidget(),
      if (userModelBuilder.health_test == true) ...[
        const CalculateBloodCheckUpWidget(),
      ],
      const CalculateBonesCheckUpWidget(),
      const CalculateDigestiveHealthWidget(),
      const CalculateEmotionsHealthWidget(),
      const CalculateWaterConsumptionWidget(),
      const CalculateSugarStatementsWidget(),
      const CalculateCurrentSymptomsWidget(),
      const CalculateCurrentGoalsWidget(),
      const CalculateFreqSportWidget(),
      const CalculateImportantGoalsWidget(),
      const CalculateFoodPreferencesWidget(),
      if (userModelBuilder.tpd_count == '1-2 TPD') ...[
        const CalculateFirstTPDWidget(),
      ] else if (userModelBuilder.tpd_count == '3 TPD') ...[
        const CalculateThirdTPDWidget(),
      ] else if (userModelBuilder.tpd_count == '4 TPD') ...[
        const CalculateFourthTPDWidget(),
      ] else if (userModelBuilder.tpd_count == '5 TPD') ...[
        const CalculateFifthTPDWidget(),
      ] else if (userModelBuilder.tpd_count == 'Intermediate Fasting') ...[
        const CalculateIntermediateFastingWidget(),
        const CalculateFastingDaysWidget(),
      ],
      const CalculateSpecificDietWidget(),
      if (userModelBuilder.is_diet == true) ...[
        const CalculateCurrentDietWidget(),
      ],
      const CalculateCookingAskWidget(),
      if (userModelBuilder.is_cooking_preference == true) ...[
        const CalculateCookingChoseWidget(),
      ],
      const CalculateSportNutritionWidget(),
      if (userModelBuilder.is_sport_nutrition == true) ...[
        const CalculateNutritionAddWidget(),
      ],
      const CalculateHealthStatusHabitsWidget(),
      const CalculateSupplementsQAWidget(),
      if (userModelBuilder.is_supplements == true) ...[
        const CalculateSupplementsListWidget(),
      ],
      const CalculateMedicamentsQAWidget(),
      if (userModelBuilder.is_medicaments == true) ...[
        const CalculateMedicamentsWidget(),
      ],
      const CalculateHomeEatingAskWidget(),
      if (userModelBuilder.is_outside_eating == true) ...[
        const CalculateHomeEatingCalendarWidget(),
      ],
      const CalculateCousinListWidget(),
      const CalculateDeliveryQAWidget(),
      if (userModelBuilder.is_delivery == true) ...[
        const CalculateDeliveryListWidget(),
      ],
      const CalculateEcoFriendlyListWidget(),
      const CalculateLocalProductsWidget(),
      CalculateDiversityPlanWidget(
        onfinished: () {
          if (!_lastPage) {
            setState(() {
              _lastPage = true;
              print("last page");
            });
          }
        },
      ),
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        leadingWidth: 70,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (pageController.page?.round() == 0) {
                    Navigator.pop(context);
                  } else {
                    FocusScope.of(context).unfocus();
                    await pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                    setButtonActivity(false);
                  }
                },
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: LinearPercentIndicator(
          padding: EdgeInsets.zero,
          animation: true,
          lineHeight: 8.0,
          width: 240,
          animationDuration: 600,
          percent: pageNotifier.value / lisWidgets.length,
          barRadius: const Radius.circular(10),
          progressColor: const Color.fromRGBO(255, 163, 132, 1),
          backgroundColor: const Color.fromRGBO(23, 23, 23, 0.25),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Color.fromARGB(255, 240, 242, 236),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: lisWidgets,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 54.0,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: _isButtonActive ? Color(0xFFA4AC9C) : Color(0xFFCDC9C4),
              ),
              child: ElevatedButton(
                onPressed: _isButtonActive
                    ? () async {
                        if (_lastPage == true) {
                          final userModel = userModelBuilder.build();
                          print(userModel.toJson());
                          platyBloc.add(CreateProfileEvent(userModel.toJson()));

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const MainHomePage()));
                        } else {
                          setState(() {
                            checkIfHabbit(lisWidgets);
                          });
                          FocusScope.of(context).unfocus();
                          await CalculateGlobalWidget.of(context)
                              .pageController
                              .nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                          setButtonActivity(false);
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
                child: Text(
                  _lastPage == true ? 'Start Now!' : 'Next',
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: showSkipButtonNotifier,
              builder: (context, showSkipButton, child) {
                return showSkipButton
                    ? TextButton(
                        onPressed: () async {
                          await pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                          setButtonActivity(false);
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
