import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';

class DiaryAddPage extends StatefulWidget {
  final int? idValue;
  final TextEditingController? titleController;
  final TextEditingController? dayController;
  final TextEditingController? monthController;
  final TextEditingController? yearController;
  final TextEditingController? bodyEditingController;
  final List<bool>? questionSelectedStates;
  const DiaryAddPage({
    Key? key,
    this.titleController,
    this.dayController,
    this.monthController,
    this.yearController,
    this.questionSelectedStates,
    this.bodyEditingController,
    this.idValue,
  }) : super(key: key);

  @override
  State<DiaryAddPage> createState() => _DiaryAddPageState();
}

class _DiaryAddPageState extends State<DiaryAddPage> {
  late int? _idValue;
  late TextEditingController _titleController;
  late TextEditingController _dayController;
  late TextEditingController _monthController;
  late TextEditingController _yearController;
  late TextEditingController _bodyEditingController;
  late List<bool> _questionSelectedStates = [];
  final now = DateTime.now();
  List<String> questions = [
    'Feeling of hunger?',
    'Enough water?',
    'Stress or frustration feeling?',
    'Late dinner?',
    'Feeling of depression?',
    'Do you have a trip?',
    'Changes in the activity \nlevel?'
  ];

  // State variables for Yes and No buttons
  bool isYesSelected = true;
  bool isNoSelected = false;

  @override
  void initState() {
    super.initState();

    // Set default values for the controllers
    _idValue = widget.idValue;
    _titleController = widget.titleController ?? TextEditingController();
    _dayController =
        widget.dayController ?? TextEditingController(text: '${now.day}');
    _monthController =
        widget.monthController ?? TextEditingController(text: '${now.month}');
    _yearController =
        widget.yearController ?? TextEditingController(text: '${now.year}');
    _questionSelectedStates =
        widget.questionSelectedStates ?? List.generate(8, (index) => true);
    _bodyEditingController =
        widget.bodyEditingController ?? TextEditingController();
  }

  Map<String, dynamic> toJson() => {
        if (_idValue != null) 'id': _idValue,
        "title": _titleController.text,
        if (_bodyEditingController.text.isNotEmpty)
          "body": _bodyEditingController.text,
        "added_at":
            '${_yearController.text}-${_monthController.text}-${_dayController.text}',
        "feeling_of_hanger": _questionSelectedStates[0],
        "enough_water": _questionSelectedStates[1],
        "stress_or_frusration": _questionSelectedStates[2],
        "late_dinner": _questionSelectedStates[3],
        "feeling_of_depression": _questionSelectedStates[4],
        "is_activity_level_changes": _questionSelectedStates[5],
        "is_trip": _questionSelectedStates[6]
      };

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
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
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
        actions: [
          Visibility(
            visible: _titleController.text.trim().isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: Text(
                      'PDF Export',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                          offset: Offset(1, 3),
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: IconButton(
                        icon: Image.asset(
                          'assets/images/download_icon.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
          ),
        ],
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Image.asset('assets/images/logo_small.png'),
      ),
      body: BlocListener<PlatyBloc, PlatyBlocState>(
        listener: (context, state) {
          if (state is NotesCreateSuccessState ||
              state is NotesUpdateByIdSuccessState) {
            Navigator.of(context).pop();
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                        maxLength: 9,
                        decoration: const InputDecoration(
                          counterText: '',
                          hintText: 'Title here...',
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
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Icon(
                        Icons.edit_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                    )
                  ],
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
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
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
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
                ),
                const SizedBox(height: 24),
                Column(
                  children: List.generate(questions.length, (index) {
                    return Padding(
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
                              buildButton('Yes', _questionSelectedStates[index],
                                  () {
                                setState(() {
                                  _questionSelectedStates[index] = true;
                                });
                              }),
                              buildButton('No', !_questionSelectedStates[index],
                                  () {
                                setState(() {
                                  _questionSelectedStates[index] = false;
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
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
                  child: TextField(
                    controller: _bodyEditingController,
                    keyboardType: TextInputType.text,
                    maxLines: null,
                    minLines: 7,
                    decoration: const InputDecoration(
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
                  onTap: _titleController.text.isNotEmpty
                      ? () {
                          if (_idValue == null) {
                            platyBloc.add(NotesCreateEvent(toJson()));
                          } else {
                            platyBloc.add(NotesUpdateByIdEvent(toJson()));
                          }
                        }
                      : null,
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
      ),
    );
  }

  Widget buildButton(String label, bool isSelected, VoidCallback onPressed) {
    Color backgroundColor =
        isSelected ? const Color.fromRGBO(252, 108, 76, 1) : Colors.white;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                offset: Offset(1, 3),
                blurRadius: 9,
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: backgroundColor == Colors.white
                    ? Colors.black
                    : Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
