import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateWeightLossWidget extends StatefulWidget {
  const CalculateWeightLossWidget({super.key});

  @override
  State<CalculateWeightLossWidget> createState() =>
      _CalculateWeightLossWidgetState();
}

class _CalculateWeightLossWidgetState extends State<CalculateWeightLossWidget> {
  bool _switchValue = true;
  TextEditingController _kgController = TextEditingController();
  TextEditingController _lbController = TextEditingController();
  bool _isButtonActive = false;

  void isActive() {
    if (_switchValue) {
      if (_kgController.text.isNotEmpty) {
        // CalculateGlobalWidget.of(context).userModelBuilder.weight_loss_goal =
        //     int.parse(_kgController.text);
        _isButtonActive = true;
      } else {
        _isButtonActive = false;
      }
    } else {
      if (_lbController.text.isNotEmpty) {
        // CalculateGlobalWidget.of(context).userModelBuilder.weight_loss_goal =
        //     int.parse(_lbController.text);
        _isButtonActive = true;
      } else {
        _isButtonActive = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: IconButton(
            icon: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 8,
                  ),
                ]),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        surfaceTintColor: Colors.transparent,
        title: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/logo_small.png',
            height: 32,
            width: 32,
          ),
        ]),
      ),
      body: Center(
        child: Column(
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
                          setState(() {
                            isActive();
                          });
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
            Container(
              height: 54.0,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: _isButtonActive ? Color(0xFFA4AC9C) : Color(0xFFCDC9C4),
              ),
              child: ElevatedButton(
                onPressed: _isButtonActive
                    ? () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pop(
                            int.parse(_kgController.text)); //TODO: LBCONTROLER
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
                  'Save',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
