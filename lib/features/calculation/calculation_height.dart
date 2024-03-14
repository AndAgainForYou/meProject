import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateHeightWidget extends StatefulWidget {
  const CalculateHeightWidget({Key? key}) : super(key: key);

  @override
  _CalculateHeightWidgetState createState() => _CalculateHeightWidgetState();
}

class _CalculateHeightWidgetState extends State<CalculateHeightWidget> {
  bool _switchValue = true;
  TextEditingController _cmController = TextEditingController();
  TextEditingController _ftController = TextEditingController();
  TextEditingController _inController = TextEditingController();

  void isActive() {
    if (_switchValue) {
      if (_cmController.text.isNotEmpty) {
        // CalculateGlobalWidget.of(context).userModelBuilder.height =
        //     "${_cmController.text}cm";
        CalculateGlobalWidget.of(context).setButtonActivity(true);
      } else {
        CalculateGlobalWidget.of(context).setButtonActivity(false);
      }
    } else {
      if (_ftController.text.isNotEmpty && _inController.text.isNotEmpty) {
        // CalculateGlobalWidget.of(context).userModelBuilder.height =
        //     "${_ftController.text}ft ${_inController.text}in";
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
        const SizedBox(
          height: 40,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How tall are you?',
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
                    'cm',
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
                    'ft',
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
                    controller: _cmController,
                    textAlign: TextAlign.start,
                    style: whiteTheme.textTheme.titleMedium
                        ?.copyWith(color: Colors.black),
                    obscureText: false,
                    onChanged: (text) {
                      isActive();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'cm',
                      hintStyle: whiteTheme.textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            if (!_switchValue)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90.0,
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
                        controller: _ftController,
                        textAlign: TextAlign.start,
                        style: whiteTheme.textTheme.titleMedium
                            ?.copyWith(color: Colors.black),
                        obscureText: false,
                        onChanged: (text) {
                          isActive();
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ft',
                          hintStyle: whiteTheme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 90.0,
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
                        controller: _inController,
                        textAlign: TextAlign.start,
                        style: whiteTheme.textTheme.titleMedium
                            ?.copyWith(color: Colors.black),
                        obscureText: false,
                        onChanged: (text) {
                          isActive();
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'in',
                          hintStyle: whiteTheme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
