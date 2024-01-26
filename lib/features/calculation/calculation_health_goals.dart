import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateHealthGoalsWidget extends StatefulWidget {
  const CalculateHealthGoalsWidget({Key? key}) : super(key: key);

  @override
  _CalculateHealthGoalsWidgetState createState() =>
      _CalculateHealthGoalsWidgetState();
}

class _CalculateHealthGoalsWidgetState
    extends State<CalculateHealthGoalsWidget> {
  String selectedPoint = '';
  bool _isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        Text(
          'Do you have health goals you want to achieve this month?',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              buildCustomContainer(
                assetPath: 'assets/images/weight_loss.png',
                label: 'Weight loss',
                subtitle: 'The Path to Strong Muscles.',
              ),
              const SizedBox(height: 10),
              buildCustomContainer(
                assetPath: 'assets/images/mental_health.png',
                label: 'Mental Health',
                subtitle: 'Bring thoughts to order',
              ),
              const SizedBox(height: 10),
              buildCustomContainer(
                assetPath: 'assets/images/skin_and_beauty.png',
                label: 'Skin and Beauty',
                subtitle: 'Look better than yesterday',
              ),
            ],
          ),
        ),
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
                ? () {
                    CalculateGlobalWidget.of(context)
                        .saveAnswer('health_goals', selectedPoint);
                    CalculateGlobalWidget.of(context).pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
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
    );
  }

  Widget buildCustomContainer(
      {required String assetPath,
      required String label,
      required String subtitle}) {
    bool isSelected = selectedPoint == label;
    _isButtonActive = selectedPoint.isEmpty ? false : true;
    ColorFilter colorFilter = isSelected || selectedPoint.isEmpty
        ? ColorFilter.mode(Colors.transparent, BlendMode.multiply)
        : ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstATop);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPoint = label;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(35, 35, 35, 0.2),
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.white,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                ColorFiltered(
                  colorFilter: colorFilter,
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: isSelected || selectedPoint.isEmpty
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: isSelected || selectedPoint.isEmpty
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
