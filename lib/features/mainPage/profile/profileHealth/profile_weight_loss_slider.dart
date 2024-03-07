import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileWeightLossSliderWidget extends StatefulWidget {
  const ProfileWeightLossSliderWidget({super.key});

  @override
  State<ProfileWeightLossSliderWidget> createState() =>
      _ProfileWeightLossSliderWidgetState();
}

class _ProfileWeightLossSliderWidgetState
    extends State<ProfileWeightLossSliderWidget> {
  double _currentSliderValue = 0;
  String? _sliderStatus;
  Map<String, dynamic> updateProfileData = {};
  @override
  void initState() {
    super.initState();
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
                'Weight loss',
                textAlign: TextAlign.center,
                style: whiteTheme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              const Text(
                'How much do you want to weigh',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '${_currentSliderValue.toInt()} kg',
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy'),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: CupertinoSlider(
                  key: const Key('slider'),
                  value: _currentSliderValue,
                  divisions: 20,
                  max: 100,
                  activeColor: const Color.fromRGBO(252, 108, 76, 1),
                  thumbColor: Colors.white,
                  onChangeStart: (double value) {
                    setState(() {
                      _sliderStatus = 'Sliding';
                    });
                  },
                  onChangeEnd: (double value) {
                    setState(() {
                      _currentSliderValue.toInt() == 0 ? false : true;
                      updateProfileData['weight_loss_goal'] =
                          _currentSliderValue.toInt();
                    });
                  },
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
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
                    BlocProvider.of<PlatyBloc>(context)
                        .add(UpdateProfilePatchEvent(updateProfileData));
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
