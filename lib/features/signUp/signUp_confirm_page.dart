import 'package:flutter/material.dart';
import 'package:platy/features/signUp/signUp_congratulation_page.dart';

class SignUpConfirmPage extends StatelessWidget {
  const SignUpConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_simple.png'),
              fit: BoxFit.cover,
            ),
          ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 82),
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 0.0, top: 35.0, right: 30.0),
                      child: Text(
                        'Consent Form',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            height: 1.1),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Introduction:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
          
                    const Text(
                      "Thank you for choosing our app dedicated to women's health and general well-being. Before you proceed, it's important for us to inform you about how your data will be processed and utilized to generate personalized nutrition plans. Please read this consent form carefully and press the button below to indicate your acceptance.",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        //height: 1,
                      ),
                    ),
          
                    const SizedBox(height: 20),
          
                    const Text(
                      '1. Purpose of Data Processing:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
          
                    const Text(
                      "The purpose of collecting your data is to provide you with personalized nutrition plans tailored to your health needs and goals. This includes utilizing third-party AI models to analyze your health and general data to generate effective and personalized recommendations.",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        //height: 1,
                      ),
                    ),
          
                    const SizedBox(height: 20),
          
                    const Text(
                      '2. Types of Data Collected:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
          
                    const Text(
                      "We will collect various types of data, including but not limited to:",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        //height: 1,
                      ),
                    ),
          
                    const SizedBox(height: 6),
                    // Example of paragraphs with dots in Flutter
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First paragraph
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\u2022', // Dot character
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w300,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(
                                  width: 7), // Add space between dot and text
                              Expanded(
                                child: Text(
                                  'Personal information: Name, age, gender, weight, height, and contact information.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w300,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 5), // Add some spacing between paragraphs
                        // Second paragraph
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\u2022', // Dot character
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w300,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(
                                  width: 7), // Add space between dot and text
                              Expanded(
                                child: Text(
                                  'Health data: Medical history, dietary preferences, allergies, physical activity levels, and any health conditions.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w300,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 5), // Add some spacing between paragraphs
                        // Third paragraph
                        Padding(
                          padding: EdgeInsets.only(left: 7),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\u2022', // Dot character
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w300,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(
                                  width: 8), // Add space between dot and text
                              Expanded(
                                child: Text(
                                  'General data: Lifestyle habits, sleep patterns, stress levels, and menstrual cycle information (if applicable).',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w300,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
          
                    const SizedBox(height: 20),
          
                    const Text(
                      '3. Data Processing and Sharing:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
          
                    const Text(
                      "Your data will be processed securely within our app and may be shared with third-party AI models for analysis and generating personalized nutrition plans. We prioritize your privacy and ensure that your data is handled in compliance with relevant data protection regulations.",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        //height: 1,
                      ),
                    ),
          
                    const SizedBox(height: 20),
          
                    const Text(
                      '4. Consent to Data Processing:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
          
                    const Text(
                      "By using our app and pressing the button below, you acknowledge and consent to the processing of your data as described herein. You understand that providing accurate and complete information is essential for generating effective nutrition plans.",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        //height: 1,
                      ),
                    ),
          
                    const SizedBox(height: 20),
          
                    const Text(
                      '5. Withdrawal of Consent:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
          
                    const Text(
                      "You have the right to withdraw your consent for data processing at any time. However, please note that withdrawing consent may limit our ability to provide personalized nutrition plans and optimize your experience with the app.",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        //height: 1,
                      ),
                    ),
          
                    const SizedBox(height: 20),
          
                    const Text(
                      '6. Data Security:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
          
                    const Text(
                      "We take data security seriously and implement industry-standard measures to safeguard your information against unauthorized access, alteration, disclosure, or destruction.",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        //height: 1,
                      ),
                    ),
          
                    const SizedBox(height: 20),
          
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SignUpCongratulationPage()));
                      },
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: 56,
                          maxWidth: MediaQuery.of(context).size.width * 0.92,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          gradient: const LinearGradient(
                            begin: Alignment(0.0, -1.0),
                            end: Alignment(1.0, 1.0),
                            colors: [
                              Color.fromRGBO(164, 171, 155, 1),
                              Color.fromRGBO(164, 171, 155, 1)
                            ],
                            stops: [0.0, 1.0],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Accept',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Gilroy',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
          
                    const Text(
                      'Contact Information:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
          
                    const SizedBox(height: 10),
          
                    const Text(
                      "If you have any questions or concerns regarding data processing or wish to exercise your rights related to data privacy, please contact us at [insert contact information].",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        //height: 1,
                      ),
                    ),
          
                    const SizedBox(height: 10),
          
                    const Text(
                      "Thank you for taking the time to read and understand this consent form. Your privacy and well-being are of utmost importance to us, and we are committed to ensuring transparency and accountability in the processing of your data.",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        //height: 1,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
