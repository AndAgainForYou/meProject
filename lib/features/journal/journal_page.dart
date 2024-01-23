import 'package:flutter/material.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  List<String> questions = [
    'View a screened device \nwhile in bed?',
    'Hydrate sufficiently?',
    'Experience any stress?',
    'Feel in control of your life?',
    'Wear blue-light blocking \nglasses before bed?',
    'Have a dog in the room \nwhile sleeping?',
  ];

  // State variables for Yes and No buttons
  bool isYesSelected = true;
  bool isNoSelected = false;
  List<bool> questionSelectedStates = List.generate(8, (index) => true);

  int counter = 0;

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void incrementCounter() {
    setState(() {
      counter++;
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
                  SizedBox(
                    width: 8,
                  ),
                  Text('Back')
                ]),
            onPressed: () {
              //Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Image.asset('assets/images/logo_small.png'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Journal',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const Text(
                'What happened yesterday ?',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Column(
                children: List.generate(questions.length, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              questions[index],
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                buildButton(
                                    Icons.check, questionSelectedStates[index],
                                    () {
                                  setState(() {
                                    questionSelectedStates[index] = true;
                                  });
                                }),
                                buildButton(
                                    Icons.close, !questionSelectedStates[index],
                                    () {
                                  setState(() {
                                    questionSelectedStates[index] = false;
                                  });
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (index == 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'For how long (min)',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.arrow_back),
                                      color:
                                          const Color.fromRGBO(252, 108, 76, 1),
                                      onPressed: decrementCounter,
                                    ),
                                    Text(
                                      '$counter',
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.arrow_forward),
                                      color:
                                          const Color.fromRGBO(252, 108, 76, 1),
                                      onPressed: incrementCounter,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                }),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                      offset: Offset(1, 3),
                      blurRadius: 10,
                    ),
                  ],
                ),
                height: 140,
                width: MediaQuery.of(context).size.width * 1,
                child: const TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 7,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Add a note...",
                    hintStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {},
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 52,
                    maxWidth: 400,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    gradient: const LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(1.0, 1.0),
                      colors: [Color(0xFF59A7A7), Color(0xFFAFCD6D)],
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
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(IconData label, bool isSelected, VoidCallback onPressed) {
    Color backgroundColor =
        isSelected ? const Color.fromRGBO(252, 108, 76, 1) : Colors.white;

    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                offset: Offset(1, 3),
                blurRadius: 9,
              ),
            ],
          ),
          child: Center(
            child: Icon(
              label,
              color:
                  backgroundColor == Colors.white ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
