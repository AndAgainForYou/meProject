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
      ],
    );
  }

  Widget buildCustomContainer(
      {required String assetPath,
      required String label,
      required String subtitle}) {
    bool isSelected = selectedPoint == label;
    ColorFilter colorFilter = isSelected || selectedPoint.isEmpty
        ? ColorFilter.mode(Colors.transparent, BlendMode.multiply)
        : ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstATop);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPoint = label;
          if (selectedPoint.isNotEmpty) {
            CalculateGlobalWidget.of(context).setButtonActivity(true);
          }
          CalculateGlobalWidget.of(context)
              .saveAnswer('health_goals', selectedPoint);
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
