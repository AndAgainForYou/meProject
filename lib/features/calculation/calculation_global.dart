import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
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
import 'package:platy/features/calculation/repositories/models/update_user_model.dart';
import 'package:platy/features/calculation/theme.dart';
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

  void setButtonActivity(bool isActive) {
    setState(() {
      _isButtonActive = isActive;
    });
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
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
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
                        onPressed: () async {
                          await pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                          setButtonActivity(false);
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            const Size.fromHeight(31.0),
                          ),
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
                  if (userModelBuilder.health_goals?[0] == 'Weight loss') ...[
                    const CalculateWeightLossWidget(),
                    const CalculateWeightLossSliderWidget(),
                  ] else if (userModelBuilder.health_goals?[0] ==
                      'Mental Health') ...[
                    const CalculateMentalHealthWidget(),
                  ] else if (userModelBuilder.health_goals?[0] ==
                      'Skin and Beauty') ...[
                    const CalculateSkinAndBeautyWidget(),
                  ],
                  const CalculateFoodPreferencesWidget(),
                  if (userModelBuilder.tpd_count == '1-2 TPD') ...[
                    const CalculateFirstTPDWidget(),
                  ] else if (userModelBuilder.tpd_count == '3 TPD') ...[
                    const CalculateThirdTPDWidget(),
                  ] else if (userModelBuilder.tpd_count == '4 TPD') ...[
                    const CalculateFourthTPDWidget(),
                  ] else if (userModelBuilder.tpd_count == '5 TPD') ...[
                    const CalculateFifthTPDWidget(),
                  ] else if (userModelBuilder.tpd_count ==
                      'Intermediate Fasting') ...[
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
                  const CalculateHealthStatusFirstWidget(),
                  const CalculateHealthStatusSecondWidget(),
                  const CalculateHealthStatusThirdWidget(),
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
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 54.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF59A7A7),
                    Color(0xFFAFCD6D),
                  ],
                ),
              ),
              child: ElevatedButton(
                onPressed: _isButtonActive
                    ? () async {
                        if (_lastPage == true) {
                          final userModel = userModelBuilder.build();

                          platyBloc.add(CreateProfileEvent(userModel.toJson()));

                          print('builded');
                          print(
                            'show:\n ${userModel.toJson()}',
                          );

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const MainHomePage()));
                        } else {
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
                child: const Text(
                  'Next',
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
    );
  }
}
