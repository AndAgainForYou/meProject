import 'package:flutter/material.dart';
import 'package:platy/features/mainPage/profile/profileHealth/custom_list_tile.dart';
import 'package:platy/features/mainPage/profile/profileHealth/theme.dart';

class ProfileDeliveryListWidget extends StatefulWidget {
  const ProfileDeliveryListWidget({Key? key}) : super(key: key);

  @override
  _ProfileDeliveryListWidgetState createState() =>
      _ProfileDeliveryListWidgetState();
}

class _ProfileDeliveryListWidgetState extends State<ProfileDeliveryListWidget> {
  List<String> titles = [
    'Italian Cuisine',
    'French Cuisine',
    'Chinese Cuisine',
    'Japanese Cuisine',
    'Indian Cuisine',
    'Mexican Cuisine',
    'Mediterranean Cuisine',
    'Home style dinner',
  ];
  List<bool> _isCheckedList = [];
  List<String> choosedTitles = [];
  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 63),
          Text(
            'Do you plan to use delivery services this week?',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
              ),
              child: const Text(
                'Next',
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
}
