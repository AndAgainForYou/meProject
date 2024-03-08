import 'package:flutter/material.dart';
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
    'Dairy',
    'Nuts',
    'Gluten',
    'Shellfish',
    'Soy',
    'Eggs',
  ];
  List<bool> _isCheckedList = [];
  List<String> choosedTitles = [];
  Map<String, dynamic> updateProfileData = {};
  TextEditingController? controllerTextField;
  List<String> alergicArray = [];
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
        alergicArray = controllerTextField!.text.split(',');
        choosedTitles.addAll(alergicArray);
        _isButtonActive = true;
      } else {
        _isButtonActive = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Image.asset('assets/images/logo_small.png'),
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
              const SizedBox(height: 63),
              Text(
                'What are you allergic to?',
                textAlign: TextAlign.center,
                style: whiteTheme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              const Text(
                'If you are not allergic, skip this step.',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 3),
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
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      title: titles[index],
                      isChecked: _isCheckedList[index],
                      onTilePressed: (isChecked) {
                        setState(() {
                          choosedTitles.add(titles[index]);
                          _isCheckedList[index] = isChecked;
                          _onTextFieldChanged();
                          _isButtonActive = true;
                          updateProfileData['alergies'] = choosedTitles;
                        });
                      },
                    );
                  },
                ),
              ),
              Container(
                height: 54.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF59A7A7),
                      Color(0xFFAFCD6D),
                    ],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: _isButtonActive
                      ? () {
                          BlocProvider.of<PlatyBloc>(context)
                              .add(UpdateProfilePatchEvent(updateProfileData));
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
      ),
    );
  }
}
