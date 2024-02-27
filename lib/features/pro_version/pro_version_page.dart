import 'package:flutter/material.dart';

class ProVersionPage extends StatefulWidget {
  const ProVersionPage({Key? key}) : super(key: key);

  @override
  _ProVersionPageState createState() => _ProVersionPageState();
}

class _ProVersionPageState extends State<ProVersionPage> {
  bool switchValue = true;
  String selectedDuration = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(1.0, -1.0, 1.0),
                child: Image.asset(
                  'assets/images/loadingPage_food.png',
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 64,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      const TextSpan(
                        text: 'Get ',
                      ),
                      TextSpan(
                        text: 'PRO',
                        style: TextStyle(
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: [
                                Color(0xFF59A7A7),
                                Color(0xFFAFCD6D),
                              ],
                            ).createShader(
                              const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                            ),
                        ),
                      ),
                      const TextSpan(
                        text: ' Access',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.add_task,
                      color: Colors.green,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Unlimited Usage / Questions & Answers',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.add_task,
                      color: Colors.green,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Ads free experience',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.add_task,
                      color: Colors.green,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Higher word counts in responses',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Free Trial Enabled',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Switch(
                          value: switchValue,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          onChanged: (bool value) {
                            setState(() {
                              switchValue = value;
                            });
                          }),
                    ]),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    customRadioListTile(
                        '3 - Months plan', '\$59,99', '\$100,99', '3 months'),
                    customRadioListTile(
                        '1 - Month plan', '\$19,99', '\$50,99', '1 month'),
                    customRadioListTile(
                        '3 - Days Free Trial', '\$9,99', '\$18,99', '3 days'),
                  ],
                ),
                const SizedBox(height: 15),
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
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shield_outlined,
                        color: Colors.green,
                      ),
                      Text(
                        ' No payment now',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customRadioListTile(
      String title, String price, String oldPrice, String value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: RadioListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 13,
            height: 1,
          ),
        ),
        value: value,
        groupValue: selectedDuration,
        onChanged: (value) {
          setState(() {
            selectedDuration = value.toString();
          });
        },
        activeColor: const Color.fromARGB(255, 244, 120, 54),
        controlAffinity: ListTileControlAffinity.trailing,
        visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
        subtitle: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$price  ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selectedDuration == value
                    ? Colors.green
                    : const Color.fromARGB(117, 36, 36, 36),
                fontSize: 28,
              ),
            ),
            Text(
              oldPrice,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(117, 36, 36, 36),
                fontSize: 16,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
