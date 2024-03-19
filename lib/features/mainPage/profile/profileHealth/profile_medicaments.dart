import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileMedicamentsWidget extends StatefulWidget {
  const ProfileMedicamentsWidget({Key? key}) : super(key: key);

  @override
  _ProfileMedicamentsWidgetState createState() =>
      _ProfileMedicamentsWidgetState();
}

class _ProfileMedicamentsWidgetState extends State<ProfileMedicamentsWidget> {
  TextEditingController? controllerTextField;
  List<String> medicamentsArray = [];
  bool _isButtonActive = false;

  @override
  void initState() {
    super.initState();
    controllerTextField = TextEditingController();
  }

  @override
  void dispose() {
    controllerTextField!.dispose();
    super.dispose();
  }

  void _onSubmitted(String text) {
    setState(() {
      if (text.isNotEmpty) {
        medicamentsArray = text.split(',');
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
          width: 32,
          height: 32,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Medicaments',
                textAlign: TextAlign.center,
                style: whiteTheme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              Container(
                height: 185,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(230, 227, 223, 1),
                    )),
                child: TextField(
                  controller: controllerTextField,
                  keyboardType: TextInputType.text,
                  maxLines: 15,
                  decoration: InputDecoration(
                    hintText:
                        'Please write the name of the medicine\nSeparated by commas',
                    hintStyle: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onSubmitted: _onSubmitted,
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
                  onPressed: _isButtonActive
                      ? () {
                          BlocProvider.of<PlatyBloc>(context).add(
                              UpdateProfilePatchEvent(
                                  {'medicaments': medicamentsArray}));
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
