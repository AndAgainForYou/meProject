import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:intl/intl.dart';
import 'package:platy/features/calculation/theme.dart';

class DiaryAddPage extends StatefulWidget {
  final int? idValue;
  final TextEditingController? titleController;
  final TextEditingController? dayController;
  final TextEditingController? monthController;
  final TextEditingController? yearController;
  final TextEditingController? bodyEditingController;
  final List<String?>? questionSelectedStates;
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
  late List<String?> _questionSelectedStates = [];
  final now = DateTime.now();
  bool _isButtonActive = false;

  List<String> titlesImages = [
    'sad',
    'happy',
    'angry',
  ];
  List<String> titles = [
    'Low',
    'Normal',
    'High',
  ];
  Map<String, dynamic> _selectedOptionsEmotions = {};
  int? _selectedIndex;
  List<int?> _selectedIndexList = List.generate(7, (index) => null);
  int? _selectedIndexEmotions;
  bool _isDigestiveIssuesYes = false;

  List<String> questions = [
    'How much energy did you have \ntoday?',
    'Have you experienced any digestive \nissues while following the meal \nplan?',
    'When digestive problems have started?',
    'How was your mood?',
    'How was your sleep?',
    'Any changes in your symptoms?',
  ];
  List<List<String>> optionsList = [
    ['Low', 'Normal', 'High'],
    ['No', 'Yes'],
    ['After breakfast', 'After lunch', 'After dinner'],
    ['Stressed out', 'Good', ' Feeling perfect'],
    ['Good', 'I had problems with sleep'],
    ['I feel better', 'I still have problems with my \nsymptoms']
  ];

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
    _questionSelectedStates = widget.questionSelectedStates ??
        List.generate(questions.length + 1, (index) => null);
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
        "mood_from_image": _questionSelectedStates[0],
        "energy": _questionSelectedStates[1],
        "digestive_issues": _questionSelectedStates[2],
        "digestive problems": _questionSelectedStates[3],
        "mood": _questionSelectedStates[4],
        "sleep": _questionSelectedStates[5],
        "symptoms": _questionSelectedStates[6],
      };
  double _getWidth() {
    int maxLength = 15;
    double initialWidth = 0.37;
    double maxWidth = 0.75;
    double width;
    if (_titleController.text.length >= 8) {
      width = initialWidth +
          (_titleController.text.length / maxLength) *
              (maxWidth - initialWidth * 1.2);
    } else if (_titleController.text.length >= 13) {
      width = maxWidth;
    } else {
      width = initialWidth;
    }

    return width;
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
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: IconButton(
            icon: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 8,
                  ),
                ]),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        surfaceTintColor: Colors.transparent,
        title: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/logo_small.png',
            height: 32,
            width: 32,
          ),
        ]),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 155,
                      height: 60,
                      color: Colors.transparent,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: _titleController,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        maxLength: 15,
                        decoration: const InputDecoration(
                          counterText: '',
                          hintText: ' Title here',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Gilroy',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none,
                        ),
                        validator: (value) {},
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                    width: 153,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.09),
                          offset: Offset(1, 3),
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          DateFormat.MMM()
                              .format(DateTime.parse(_monthController.text)),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          _dayController.text,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          _yearController.text,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 30),
                Text(
                  'How was your mood today?',
                  textAlign: TextAlign.center,
                  style: whiteTheme.textTheme.titleSmall,
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200, // Set a fixed height for the ListView
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          border: _selectedIndexEmotions == index
                              ? Border.all(
                                  color: const Color.fromRGBO(164, 171, 155, 1),
                                  width: 2,
                                )
                              : null,
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndexEmotions = index;
                              _questionSelectedStates[0] =
                                  titles[_selectedIndexEmotions!];
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/${titlesImages[index]}-image.png',
                                width: 150,
                                height: 150,
                              ),
                              Text(
                                titles[index],
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.only(
                          top: 20, right: 10, bottom: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                questions[0],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Column(
                            children: [
                              buildButton(
                                optionsList[0],
                                optionsList[0].length,
                                _selectedIndexList[0],
                                (selectedIndex) {
                                  setState(() {
                                    _questionSelectedStates[1] =
                                        optionsList[0][selectedIndex!];
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.only(
                          top: 20, right: 10, bottom: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                questions[1],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Column(
                            children: [
                              buildButton(
                                optionsList[1],
                                optionsList[1].length,
                                _selectedIndexList[1],
                                (selectedIndex) {
                                  setState(() {
                                    _questionSelectedStates[2] =
                                        optionsList[1][selectedIndex!];
                                    if (selectedIndex == 1) {
                                      _isDigestiveIssuesYes = true;
                                    } else {
                                      _isDigestiveIssuesYes = false;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                _isDigestiveIssuesYes
                    ? Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.white,
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            padding: const EdgeInsets.only(
                                top: 20, right: 10, bottom: 10, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      questions[2],
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Column(
                                  children: [
                                    buildButton(
                                      optionsList[2],
                                      optionsList[2].length,
                                      _selectedIndexList[2],
                                      (selectedIndex) {
                                        setState(() {
                                          _questionSelectedStates[3] =
                                              optionsList[2][selectedIndex!];
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.only(
                          top: 20, right: 10, bottom: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                questions[3],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Column(
                            children: [
                              buildButton(
                                optionsList[3],
                                optionsList[3].length,
                                _selectedIndexList[3],
                                (selectedIndex) {
                                  setState(() {
                                    _questionSelectedStates[4] =
                                        optionsList[3][selectedIndex!];
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.only(
                          top: 20, right: 10, bottom: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                questions[4],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Column(
                            children: [
                              buildButton(
                                optionsList[4],
                                optionsList[4].length,
                                _selectedIndexList[4],
                                (selectedIndex) {
                                  setState(() {
                                    _questionSelectedStates[5] =
                                        optionsList[4][selectedIndex!];
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.only(
                          top: 20, right: 10, bottom: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                questions[5],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Column(
                            children: [
                              buildButton(
                                optionsList[5],
                                optionsList[5].length,
                                _selectedIndexList[5],
                                (selectedIndex) {
                                  setState(() {
                                    _questionSelectedStates[6] =
                                        optionsList[5][selectedIndex!];
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.09),
                        offset: Offset(1, 3),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  height: 200,
                  width: MediaQuery.of(context).size.width * 1,
                  child: TextField(
                    controller: _bodyEditingController,
                    keyboardType: TextInputType.text,
                    maxLines: null,
                    minLines: 7,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Add a note...",
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45),
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
                      borderRadius: BorderRadius.circular(25.0),
                      color: _isButtonActive
                          ? const Color(0xFFA4AC9C)
                          : const Color(0xFFCDC9C4),
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

  Widget buildButton(List<String> options, int count, int? selectedIndex,
      void Function(int?)? onChanged) {
    return Column(
      children: List.generate(count, (rowIndex) {
        return Column(
          children: List.generate(options.length, (colIndex) {
            final index = rowIndex * options.length + colIndex;
            if (index >= count) return SizedBox.shrink(); // Hide excess buttons
            return Row(
              children: [
                Radio<int>(
                  value: index,
                  groupValue: selectedIndex,
                  onChanged: onChanged,
                  activeColor: const Color(0xFFA4AC9C),
                ),
                GestureDetector(
                  onTap: () {
                    if (onChanged != null) {
                      onChanged(index);
                    }
                  },
                  child: Text(
                    options[index],
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            );
          }),
        );
      }),
    );
  }
}
