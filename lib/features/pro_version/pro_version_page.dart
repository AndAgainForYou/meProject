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
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        leadingWidth: 130,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  FocusScope.of(context).unfocus();
                },
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        elevation: 0.0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_noOrange.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              children: [
                SizedBox(height: 110,),
                Container(
                  child: Image.asset(
                    'assets/images/logo_small.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Get PRO Access',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Unlimited Usage / Priority Support',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Connect wearables & health apps',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Exclusive Content',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Expert Consultation / Live Support',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '  Free Trial Enabled',
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Switch(
                              value: switchValue,
                              activeColor: Colors.white,
                              activeTrackColor:
                                  const Color.fromRGBO(255, 163, 132, 1),
                              onChanged: (bool value) {
                                setState(() {
                                  switchValue = value;
                                });
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          customRadioListTile('3 - Months plan', '\$59,99',
                              '\$100,99', '3 months'),
                          customRadioListTile('1 - Month plan', '\$19,99',
                              '\$50,99', '1 month'),
                          customRadioListTile('3 - Days Free Trial', '\$9,99',
                              '\$18,99', '3 days'),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Container(
                        height: 56.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: const Color.fromRGBO(164, 171, 155, 1),
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
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  ' No payment now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 163, 132, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customRadioListTile(
      String title, String price, String oldPrice, String value) {
    return Container(
      height: 86,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: selectedDuration == value
            ? Border.all(
                width: 2, color: const Color.fromRGBO(164, 171, 155, 1))
            : Border.all(width: 2, color: Colors.transparent),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RadioListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 14,
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
              activeColor: const Color.fromRGBO(164, 171, 155, 1),
              //controlAffinity: ListTileControlAffinity.trailing,
              visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$price   ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: selectedDuration == value
                      ? const Color.fromRGBO(255, 163, 132, 1)
                      : const Color.fromARGB(117, 36, 36, 36),
                  fontSize: 25,
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
        ],
      ),
    );
  }
}
