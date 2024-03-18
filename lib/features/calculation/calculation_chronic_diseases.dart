import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/custom_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateChronicDiseasesListWidget extends StatefulWidget {
  const CalculateChronicDiseasesListWidget({Key? key}) : super(key: key);

  @override
  _CalculateChronicDiseasesListWidgetState createState() =>
      _CalculateChronicDiseasesListWidgetState();
}

class _CalculateChronicDiseasesListWidgetState
    extends State<CalculateChronicDiseasesListWidget> {
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
  List<String> diseasesArray = [];

  @override
  void initState() {
    super.initState();

    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Health History',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
        const Text(
          'If you have not had any of these conditions,\nskip this step',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 30),
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
                    CalculateGlobalWidget.of(context)
                        .userModelBuilder
                        .chronic_diseases = choosedTitles;
                    CalculateGlobalWidget.of(context)
                        .setButtonActivity(_isCheckedList.contains(true));
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
