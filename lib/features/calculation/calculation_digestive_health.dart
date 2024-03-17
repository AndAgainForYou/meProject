import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateDigestiveHealthWidget extends StatefulWidget {
  const CalculateDigestiveHealthWidget({Key? key}) : super(key: key);

  @override
  _CalculateDigestiveHealthWidgetState createState() =>
      _CalculateDigestiveHealthWidgetState();
}

class _CalculateDigestiveHealthWidgetState
    extends State<CalculateDigestiveHealthWidget> {
  List<String> titles = [
    'Bloating',
    'Gas',
    'Irregular bowel movements',
  ];
  Map<String, dynamic> _selectedOptions = {};
  void isActive() {
    if (_selectedOptions.length == titles.length) {
      CalculateGlobalWidget.of(context).setButtonActivity(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Digestive Health',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          'Add information from your last blood check-up',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodySmall,
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Container(
                height: 140,
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
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedOptions[titles[index]] = 'No';
                              isActive();
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                value: 'No',
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
                                'No',
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
                              _selectedOptions[titles[index]] = 'Yes';
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
                                value: 'Yes',
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
                                'Yes',
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
