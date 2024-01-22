import 'package:flutter/material.dart';
import 'package:platy/features/generation/meal_generation_page.dart';
import 'package:platy/features/loading/loading_page.dart';
import 'package:platy/features/login/login_page.dart';
import 'package:platy/features/pro_version/pro_version_page.dart';
import 'package:platy/features/restore_password/restore_password_page.dart';
import 'package:platy/features/signUp/signUp_congratulation_page.dart';
import 'package:platy/features/signUp/signUp_page.dart';
import 'package:platy/features/calculation/calculation_global.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: '/',
      routes: {
        '/': (context) => const CalculateGlobalWidget(), //LoadingPage
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/signUpCongratulation': (context) => const SignUpCongratulationPage(),
        '/RestorePasswordPage': (context) => const RestorePasswordPage(),
        '/MealGenerationPage': (context) => const MealGenerationPage(),
        '/ProVersionPage': (context) => const ProVersionPage(),
      },
      //home: const SignUpPage(),
    );
  }
}

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 1100,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 129,
            left: 16,
            child: buildWelcomeSection(),
          ),
          Positioned(
            top: 1017,
            left: 0,
            child: buildBottomMenu(),
          ),
        ],
      ),
    );
  }

  Widget buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          buildHeaderText('Hello, Nick !', 'Let\'s see your results'),
          const SizedBox(height: 16),
          buildGoalSection(),
          const SizedBox(height: 16),
          buildStatsCard(),
          const SizedBox(height: 16),
          buildMealPlan(),
        ],
      ),
    );
  }

  Widget buildHeaderText(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.ltr,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromRGBO(36, 36, 36, 1),
                  fontFamily: 'Gilroy',
                  fontSize: 32,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          const SizedBox(height: 0),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromRGBO(36, 36, 36, 1),
                  fontFamily: 'Gilroy',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGoalSection() {
    return Container();
  }

  Widget buildStatsCard() {
    return Container();
  }

  Widget buildMealPlan() {
    return Container();
  }

  Widget buildBottomMenu() {
    return Container();
  }
}
