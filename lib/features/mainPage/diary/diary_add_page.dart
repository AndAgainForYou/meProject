import 'package:flutter/material.dart';

class DiaryAddPage extends StatefulWidget {
  const DiaryAddPage({super.key});

  @override
  State<DiaryAddPage> createState() => _DiaryAddPageState();
}

class _DiaryAddPageState extends State<DiaryAddPage> {
  late TextEditingController _titleController;
  late TextEditingController _dayController;
  late TextEditingController _monthController;
  late TextEditingController _yearController;

  @override
  void initState() {
    super.initState();

    // Set default values for the controllers
    _titleController = TextEditingController();
    _dayController = TextEditingController(text: '10');
    _monthController = TextEditingController(text: '01');
    _yearController = TextEditingController(text: '2002');
  }

  @override
  void dispose() {
    // Dispose of the controllers when not needed
    _titleController.dispose();
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    super.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: _titleController,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                  maxLength: 15,
                  decoration: const InputDecoration(
                    counterText: '',
                    hintText: 'Title here',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Gilroy',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {},
                  validator: (value) {},
                ),
              ),
              const SizedBox(height: 24),
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
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Day  ',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextFormField(
                              controller: _dayController,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              maxLength: 2,
                              decoration: const InputDecoration(
                                counterText: '',
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Gilroy',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {},
                              validator: (value) {},
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Month  ',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: _monthController,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              maxLength: 2,
                              decoration: const InputDecoration(
                                counterText: '',
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.transparent,
                                  fontFamily: 'Gilroy',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {},
                              validator: (value) {},
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Year  ',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.13,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: TextFormField(
                              controller: _yearController,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              maxLength: 4,
                              decoration: const InputDecoration(
                                counterText: '',
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Gilroy',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {},
                              validator: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
