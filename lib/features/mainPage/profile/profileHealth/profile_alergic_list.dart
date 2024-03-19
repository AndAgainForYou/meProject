import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/mainPage/profile/profileHealth/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileAlergicListWidget extends StatefulWidget {
  const ProfileAlergicListWidget({Key? key}) : super(key: key);

  @override
  _ProfileAlergicListWidgetState createState() =>
      _ProfileAlergicListWidgetState();
}

class _ProfileAlergicListWidgetState extends State<ProfileAlergicListWidget> {
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
  final List<String> _selectedOptions = List.generate(5, (index) => '');
  TextEditingController? controllerTextField;
  List<String> alergicArray = [];
  String? _textValue;

  List<String> choosedTitles = [];
  Map<String, dynamic> updateProfileData = {};
  bool _isButtonActive = false;

  @override
  void initState() {
    super.initState();
    controllerTextField = TextEditingController();
  }

  void isActive() {
    setState(() {
      if (controllerTextField!.text.isNotEmpty || choosedTitles.isNotEmpty) {
        alergicArray = _textValue != null ? _textValue!.split(',') : [];
        choosedTitles.addAll(alergicArray);
        updateProfileData['alergies'] = choosedTitles;
        _isButtonActive = true;
      } else {
        _isButtonActive = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        leading: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: IconButton(
            icon: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back),
                SizedBox(width: 8),
                Text('Back'),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
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
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    if (index < titles.length - 1) {
                      return Container(
                        height: 140,
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
                                      _selectedOptions[index] = 'No';
                                      choosedTitles.remove(titles[index]);
                                      isActive();
                                    });
                                    print(choosedTitles);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Radio(
                                        value: 'No',
                                        activeColor: const Color.fromRGBO(
                                            164, 171, 155, 1),
                                        groupValue: _selectedOptions[index],
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedOptions[index] = 'No';
                                            choosedTitles.remove(titles[index]);
                                            isActive();
                                          });
                                          print(choosedTitles);
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
                                      choosedTitles.add(titles[index]);
                                      isActive();
                                    });
                                    print(choosedTitles);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Radio(
                                        activeColor: const Color.fromRGBO(
                                            164, 171, 155, 1),
                                        value: 'Yes',
                                        groupValue: _selectedOptions[index],
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedOptions[index] = 'Yes';
                                            choosedTitles.add(titles[index]);
                                            isActive();
                                          });
                                          print(choosedTitles);
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
                            Image.asset(
                                'assets/images/${pictureTitle[index]}.png'),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 320,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Other',
                              textAlign: TextAlign.center,
                              style: whiteTheme.textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 10,
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
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.09000000357627869),
                                    offset: Offset(1, 3),
                                    blurRadius: 9,
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: controllerTextField,
                                onSubmitted: (text) {
                                  setState(() {
                                    _textValue = text;
                                    isActive();
                                  });
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText:
                                      ' Add your option separated by commas',
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
                            const Spacer(),
                            Container(
                              height: 54.0,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color.fromRGBO(164, 171, 155, 1),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  _isButtonActive
                                      ? BlocProvider.of<PlatyBloc>(context).add(
                                          UpdateProfilePatchEvent(
                                              updateProfileData))
                                      : null;
                                },
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
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
