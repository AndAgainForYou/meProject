import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateAlergicListWidget extends StatefulWidget {
  const CalculateAlergicListWidget({Key? key}) : super(key: key);

  @override
  _CalculateAlergicListWidgetState createState() =>
      _CalculateAlergicListWidgetState();
}

class _CalculateAlergicListWidgetState
    extends State<CalculateAlergicListWidget> {
  List<String> titles = [
    'Shellfish',
    'Nuts',
    'Eggs',
    'Milk',
    'Soy',
  ];
  List<String> pictureTitle = [
    'shellfish',
    'nuts',
    'eggs',
    'milk',
    'soy',
  ];
  List<String> _selectedOptions = List.filled(5, '');
  TextEditingController? controllerTextField;
  List<String> alergicArray = [];
  String? _textValue;

  @override
  void initState() {
    super.initState();
    controllerTextField = TextEditingController();
    controllerTextField!.addListener(_onTextFieldChanged);
  }

  void _onTextFieldChanged() {
    setState(() {
      _textValue = controllerTextField!.text;
      alergicArray = _textValue!.split(',');
      CalculateGlobalWidget.of(context).userModelBuilder.chronic_diseases =
          alergicArray;
      CalculateGlobalWidget.of(context)
          .setButtonActivity(alergicArray.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //const SizedBox(height: 40),
        Text(
          'What are you allergic to?',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 14),
        const Text(
          'If you are not allergic, skip this step',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              if (index < titles.length - 1) {
                return Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                                _selectedOptions[index] = 'No';
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio(
                                  value: 'No',
                                  activeColor:
                                      const Color.fromRGBO(164, 171, 155, 1),
                                  groupValue: _selectedOptions[index],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedOptions[index] =
                                          value.toString();
                                    });
                                  },
                                ),
                                const Text('No'),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedOptions[index] = 'Yes';
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
                                  groupValue: _selectedOptions[index],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedOptions[index] =
                                          value.toString();
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
                      Image.asset('assets/images/${pictureTitle[index]}.png'),
                    ],
                  ),
                );
              } else {
                return Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Other',
                      textAlign: TextAlign.center,
                      style: whiteTheme.textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 180,
                      width: 340,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                            offset: Offset(1, 3),
                            blurRadius: 9,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: controllerTextField,
                        decoration: InputDecoration(
                          hintText: ' Add your option separated by commas',
                          hintStyle: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
