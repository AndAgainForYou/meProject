import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateWeightWidget extends StatefulWidget {
  const CalculateWeightWidget({Key? key}) : super(key: key);

  @override
  _CalculateWeightWidgetState createState() => _CalculateWeightWidgetState();
}

class _CalculateWeightWidgetState extends State<CalculateWeightWidget> {
  bool _switchValue = true;
  TextEditingController _kgController = TextEditingController();
  TextEditingController _lbController = TextEditingController();

  void isActive() {
    if (_switchValue) {
      if (_kgController.text.isNotEmpty) {
        CalculateGlobalWidget.of(context).userModelBuilder.weight =
            "${_kgController.text}kg";
        CalculateGlobalWidget.of(context).setButtonActivity(true);
      } else {
        CalculateGlobalWidget.of(context).setButtonActivity(false);
      }
    } else {
      if (_lbController.text.isNotEmpty) {
        CalculateGlobalWidget.of(context).userModelBuilder.weight =
            "${_lbController.text}lb";
        CalculateGlobalWidget.of(context).setButtonActivity(true);
      } else {
        CalculateGlobalWidget.of(context).setButtonActivity(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const SizedBox(
        //   height: 40,
        // ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What's your weight?",
              textAlign: TextAlign.center,
              style: whiteTheme.textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: 30),
        Container(
          alignment: Alignment.center,
          width: 112,
          height: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                width: 1, color: const Color.fromRGBO(230, 227, 223, 1)),
            color: const Color.fromRGBO(205, 201, 196, 0.24),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _switchValue = true;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 55,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: _switchValue
                        ? const Color.fromRGBO(196, 203, 185, 1)
                        : Colors.transparent,
                  ),
                  child: const Text(
                    'kg',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _switchValue = false;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 55,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: !_switchValue
                        ? const Color.fromRGBO(196, 203, 185, 1)
                        : Colors.transparent,
                  ),
                  child: const Text(
                    'lb',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Column(
          children: [
            if (_switchValue)
              Container(
                width: 160.0,
                height: 52.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: const Color.fromRGBO(230, 227, 223, 1),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.orange,
                    controller: _kgController,
                    textAlign: TextAlign.start,
                    style: whiteTheme.textTheme.titleMedium
                        ?.copyWith(color: Colors.black),
                    obscureText: false,
                    onChanged: (text) {
                      isActive();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'kg',
                      hintStyle: whiteTheme.textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            if (!_switchValue)
              Container(
                width: 160.0,
                height: 52.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: const Color.fromRGBO(230, 227, 223, 1),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.orange,
                    controller: _lbController,
                    textAlign: TextAlign.start,
                    style: whiteTheme.textTheme.titleMedium
                        ?.copyWith(color: Colors.black),
                    obscureText: false,
                    onChanged: (text) {
                      isActive();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'lb',
                      hintStyle: whiteTheme.textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
