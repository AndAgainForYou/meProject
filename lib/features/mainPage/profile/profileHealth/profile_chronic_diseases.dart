import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/calculation/custom_list_tile_with_radio.dart';
import 'package:platy/features/mainPage/profile/profileHealth/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileChronicDiseasesListWidget extends StatefulWidget {
  const ProfileChronicDiseasesListWidget({Key? key}) : super(key: key);

  @override
  _ProfileChronicDiseasesListWidgetState createState() =>
      _ProfileChronicDiseasesListWidgetState();
}

class _ProfileChronicDiseasesListWidgetState
    extends State<ProfileChronicDiseasesListWidget> {
  List<String> titles = [
    'Diabetes',
    'Cardiovascular diseases',
    'Hyperlipidemia',
    'Osteoporosis',
    'Hypothyroidism',
    'Hyperthyroidism',
    'GERD/Gastritis',
    'Anemia',
    'Hypertension',
    'Coeliac Disease',
    'Autoimmune Diseases',
  ];
  List<bool> _isCheckedList = [];
  List<String> choosedTitles = [];
  Map<String, dynamic> updateProfileData = {};
  TextEditingController? controllerTextField;
  List<String> diseasesArray = [];
  bool _isButtonActive = false;
  @override
  void initState() {
    super.initState();
    controllerTextField = TextEditingController();
    controllerTextField!.addListener(_onTextFieldChanged);
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  void _onTextFieldChanged() {
    setState(() {
      if (controllerTextField!.text.isNotEmpty) {
        diseasesArray = controllerTextField!.text.split(',');
        choosedTitles.addAll(diseasesArray);
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
        toolbarHeight: 90,
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
                'Health History',
                textAlign: TextAlign.center,
                style: whiteTheme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: titles.length, // Add 1 for the last element
                  itemBuilder: (context, index) {
                    if (index < titles.length) {
                      // Render custom list tile for titles
                      return /*CustomListTile(
                        title: titles[index],
                        isChecked: _isCheckedList[index],
                        onTilePressed: (isChecked) {
                          setState(() {
                            choosedTitles.add(titles[index]);
                            _isCheckedList[index] = isChecked;
                            _onTextFieldChanged();
                            _isButtonActive = true;
                            updateProfileData['chronic_diseases'] =
                                choosedTitles;
                          });
                        },
                      ); */
                          CustomListTileWithRadio(
                        title: titles[index],
                        isChecked: _isCheckedList[index],
                        customStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                        onTilePressed: (isChecked) {
                          setState(() {
                            if (isChecked) {
                              // Якщо вже вибрано, видаляємо
                              choosedTitles.add(titles[index]);
                            } else {
                              // Якщо не вибрано, додаємо
                              choosedTitles.remove(titles[index]);
                            }
                            _isCheckedList[index] = isChecked;
                            _onTextFieldChanged();

                            _isButtonActive = true;
                            updateProfileData['chronic_diseases'] =
                                choosedTitles;
                          });
                          print(_isButtonActive);
                        },
                      );
                    }
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
                  onPressed: () {
                    _isButtonActive
                        ? BlocProvider.of<PlatyBloc>(context)
                            .add(UpdateProfilePatchEvent(updateProfileData))
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
        ),
      ),
    );
  }
}
