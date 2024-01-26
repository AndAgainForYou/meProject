import 'package:flutter/material.dart';
import 'package:platy/features/mainPage/profile/profile_health_status_page.dart';

class ProfileChangeFilledPage extends StatefulWidget {
  const ProfileChangeFilledPage({super.key});

  @override
  State<ProfileChangeFilledPage> createState() =>
      _ProfileChangeFilledPageState();
}

class _ProfileChangeFilledPageState extends State<ProfileChangeFilledPage> {
  final List<String> elements = [
    'Diversity of the plan',
    'Health status',
    'Health status',
    'Health status',
    'Health status',
    'Health status',
    'Health status',
    'Health status',
    'Health status',
    'Health status',
    'Health status',
    'Health status',
    'Health status',
    'Health status',
    'Health status',
    // Add 13 more elements as needed
  ];

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
                  SizedBox(
                    width: 8,
                  ),
                  Text('Back')
                ]),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Сhange filled data',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Gilroy',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 4.0),
            child: IconButton(
                onPressed: () {},
                icon: const Text(
                  'Clear All',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(255, 87, 87, 1)),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, left: 10.0, right: 10.0, bottom: 100.0),
        
          child: Column(
            children: generateListWidgets(elements),
          ),
        
          
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Container(
          height: 52.0,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              gradient: const LinearGradient(colors: [
                Color(0xFF59A7A7),
                Color(0xFFAFCD6D),
              ])),
          child: FloatingActionButton(
            heroTag: "MyFirstPage",
            splashColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(50)),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> generateListWidgets(List<String> elements) {
    return List.generate(elements.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                    offset: Offset(1, 3),
                    blurRadius: 9,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${index + 1}. ',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          elements[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HealthStatusPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(30, 26),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 4.0,
                          bottom: 4.0,
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Gilroy',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      );
    });
  }
}
