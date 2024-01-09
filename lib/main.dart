import 'package:flutter/material.dart';
import 'package:platy/login.dart';

void main() => runApp(LoginWidget());

class MainScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 1100,
      decoration: BoxDecoration(
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
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          buildHeaderText('Hello, Nick !', 'Let\'s see your results'),
          SizedBox(height: 16),
          buildGoalSection(),
          SizedBox(height: 16),
          buildStatsCard(),
          SizedBox(height: 16),
          buildMealPlan(),
        ],
      ),
    );
  }

  Widget buildHeaderText(String title, String subtitle) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 32,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 0),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(36, 36, 36, 1),
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGoalSection() {
    return Container(
    );
  }

  Widget buildStatsCard() {
    return Container(
    );
  }

  Widget buildMealPlan() {
    return Container(
    );
  }

  Widget buildBottomMenu() {
    return Container(
    );
  }

}
