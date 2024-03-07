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
  @override
  void initState() {
    super.initState();
    controllerTextField = TextEditingController();
    controllerTextField!.addListener(_onTextFieldChanged);
  }

  @override
  void dispose() {
    controllerTextField!.dispose();
    super.dispose();
  }

  void _onTextFieldChanged() {
    setState(() {
      if (controllerTextField!.text.isNotEmpty) {
        medicamentsArray = controllerTextField!.text.split(',');
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 63),
              Text(
                'Medicaments',
                textAlign: TextAlign.center,
                style: whiteTheme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              const Text(
                'Choose the ones below',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 140,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                      offset: Offset(1, 3),
                      blurRadius: 9,
                    ),
                    BoxShadow(
                      color: Colors.white,
                    ),
                  ],
                ),
                child: TextField(
                  controller: controllerTextField,
                  decoration: InputDecoration(
                    hintText: ' Please write down the name of the medicine',
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
                  onPressed: () {
                    BlocProvider.of<PlatyBloc>(context).add(
                        UpdateProfilePatchEvent(
                            {'medicaments': medicamentsArray}));
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
