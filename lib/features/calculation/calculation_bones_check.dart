import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateBonesCheckUpWidget extends StatefulWidget {
  const CalculateBonesCheckUpWidget({Key? key}) : super(key: key);

  @override
  _CalculateBonesCheckUpWidgetState createState() =>
      _CalculateBonesCheckUpWidgetState();
}

class _CalculateBonesCheckUpWidgetState
    extends State<CalculateBonesCheckUpWidget> {
  List<String> titles = [
    'Vitamin D',
    'Calcium',
    'Phosphorus',
    'Alkaline phosphatase',
  ];
  Map<String, dynamic> _selectedOptions = {};
  void isActive() {
    if (_selectedOptions.isNotEmpty) {
      CalculateGlobalWidget.of(context).userModelBuilder.bone_check_up =
          _selectedOptions;
      CalculateGlobalWidget.of(context).setButtonActivity(true);
    } else {
      CalculateGlobalWidget.of(context).setButtonActivity(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Bone Health',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Container(
                height: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "   ${titles[index]}",
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedOptions[titles[index]] = 'Low';
                              isActive();
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                value: 'Low',
                                activeColor:
                                    const Color.fromRGBO(164, 171, 155, 1),
                                groupValue: _selectedOptions[titles[index]],
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOptions[titles[index]] =
                                        value.toString();
                                    isActive();
                                  });
                                },
                              ),
                              const Text(
                                'Low',
                                style: TextStyle(
                                  fontFamily: 'Gillroy',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedOptions[titles[index]] = 'Normal';
                              isActive();
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                activeColor:
                                    const Color.fromRGBO(164, 171, 155, 1),
                                value: 'Normal',
                                groupValue: _selectedOptions[titles[index]],
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOptions[titles[index]] =
                                        value.toString();
                                    isActive();
                                  });
                                },
                              ),
                              const Text(
                                'Normal',
                                style: TextStyle(
                                  fontFamily: 'Gillroy',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedOptions[titles[index]] = 'High';
                              isActive();
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                activeColor:
                                    const Color.fromRGBO(164, 171, 155, 1),
                                value: 'High',
                                groupValue: _selectedOptions[titles[index]],
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOptions[titles[index]] =
                                        value.toString();
                                    isActive();
                                  });
                                },
                              ),
                              const Text(
                                'High',
                                style: TextStyle(
                                  fontFamily: 'Gillroy',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
