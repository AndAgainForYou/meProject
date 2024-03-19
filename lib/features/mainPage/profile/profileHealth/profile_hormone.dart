import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileHormoneWidget extends StatefulWidget {
  const ProfileHormoneWidget({Key? key}) : super(key: key);

  @override
  _ProfileHormoneWidgetState createState() => _ProfileHormoneWidgetState();
}

class _ProfileHormoneWidgetState extends State<ProfileHormoneWidget> {
  List<String> titles = [
    'Estrogen',
    'Progesterone',
    'Testosterone',
  ];
  Map<String, dynamic> _selectedOptions = {};
  void isActive() {
    if (_selectedOptions.length == titles.length) {
      //bone_check_up
      _isButtonActive = true;
    } else {
      _isButtonActive = false;
    }
  }

  List<bool> _isCheckedList = [];
  List<String> choosedTitles = [];
  bool _isButtonActive = false;
  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        appBar: AppBar(
          toolbarHeight: 90,
          leading: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: IconButton(
              icon: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 8),
                  Text(''),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          leadingWidth: 90,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 240, 242, 236),
          surfaceTintColor: Colors.transparent,
          title: Image.asset(
            'assets/images/logo_small.png',
            height: 32,
            width: 32,
          ),
        ),
        body: BlocListener<PlatyBloc, PlatyBlocState>(
          listener: (context, state) {
            if (state is ProfileIncludesDataState) {
              Navigator.of(context).pop();
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hormone panel',
                  textAlign: TextAlign.center,
                  style: whiteTheme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 14),
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
                        height: 185,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
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
                                      _selectedOptions[titles[index]] = 'Low';
                                      isActive();
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Radio(
                                        value: 'Low',
                                        activeColor: const Color.fromRGBO(
                                            164, 171, 155, 1),
                                        groupValue:
                                            _selectedOptions[titles[index]],
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
                                      _selectedOptions[titles[index]] =
                                          'Normal';
                                      isActive();
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Radio(
                                        activeColor: const Color.fromRGBO(
                                            164, 171, 155, 1),
                                        value: 'Normal',
                                        groupValue:
                                            _selectedOptions[titles[index]],
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
                                        activeColor: const Color.fromRGBO(
                                            164, 171, 155, 1),
                                        value: 'High',
                                        groupValue:
                                            _selectedOptions[titles[index]],
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
                Container(
                  height: 54.0,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromRGBO(164, 171, 155, 1),
                  ),
                  child: ElevatedButton(
                    onPressed: _isButtonActive
                        ? () {
                            BlocProvider.of<PlatyBloc>(context).add(
                                UpdateProfilePatchEvent(
                                    {'blood_check_up': _selectedOptions}));
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
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
