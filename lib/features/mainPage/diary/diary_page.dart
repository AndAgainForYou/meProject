import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/mainPage/diary/diary_add_page.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  List<Map<String, dynamic>> items = [
    {
      'id': 3,
      'title': 'Coca-Cola',
      'body': 'asdasdsadads',
      'added_at': '2024-02-28',
      'feeling_of_hanger': false,
      'enough_water': true,
      'stress_or_frusration': false,
      'late_dinner': true,
      'feeling_of_depression': true,
      'is_trip': true,
      'is_activity_level_changes': true
    }
  ];

  List<bool> createListParametrs(Map<String, dynamic> data) {
    List<bool> questionSelectedStates = [];
    data.forEach((key, value) {
      if (key != 'id' && key != 'title' && key != 'body' && key != 'added_at') {
        questionSelectedStates.add(value);
      }
    });
    return questionSelectedStates;
  }

  @override
  void initState() {
    super.initState();
    PlatyBloc platyBloc = BlocProvider.of<PlatyBloc>(context);
    //platyBloc.add(NotesGetAllEvent({}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo_small.png',
          height: 32,
          width: 32,
        ),
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      ),
      body: BlocListener<PlatyBloc, PlatyBlocState>(
        listener: (context, state) {
          if (state is NotesAllState) {
            state.notesData['notes'].forEach((item) {
              items.add(item);
            });
            setState(() {});
            print('List Items: $items');
          }
          if (state is NotesCreateSuccessState) {
            setState(() {
              items.add(state.successMessage);
            });
          }
          if (state is NotesDeleteSuccessState) {
            setState(() {
              items.removeWhere(
                  (element) => element['id'] == state.successMessage);
            });
          }
          if (state is NotesUpdateByIdSuccessState) {
            setState(() {
              items[items.indexWhere((element) =>
                      element['id'] == state.successMessage['id'])] =
                  state.successMessage;
            });
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Diary',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Write down your thoughts on this day',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Color.fromRGBO(230, 227, 223, 1),
                      width: 2,
                    ),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    maxLength: 25,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Image.asset('assets/images/search_icon.png',
                          width: 20),
                    ),
                    onChanged: (value) {},
                    validator: (value) {},
                    //controller: _emailController,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Previous 30 days',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.09),
                        offset: Offset(1, 3),
                        blurRadius: 9,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(items.length, (index) {
                      return Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DiaryAddPage(
                                          idValue: items[index]['id'],
                                          titleController:
                                              TextEditingController(
                                                  text: items[index]['title']),
                                          dayController: TextEditingController(
                                              text: items[index]['added_at']
                                                  .split('-')[2]),
                                          monthController:
                                              TextEditingController(
                                                  text: items[index]['added_at']
                                                      .split('-')[1]),
                                          yearController: TextEditingController(
                                              text: items[index]['added_at']
                                                  .split('-')[0]),
                                          // questionSelectedStates:
                                          //     createListParametrs(items[index]),
                                          bodyEditingController:
                                              TextEditingController(
                                                  text: items[index]['body']),
                                        )),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                  top: 8.0,
                                  bottom: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index]['title'] ?? '',
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            items[index]['added_at']
                                                    .split('-')[2] ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const Text('.'),
                                          Text(
                                            items[index]['added_at']
                                                    .split('-')[1] ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const Text('.'),
                                          Text(
                                            items[index]['added_at']
                                                    .split('-')[0] ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<PlatyBloc>(context)
                                          .add(NotesDeleteEvent(items[index]));
                                    },
                                    child: Image.asset(
                                      'assets/images/trash-icon.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // Conditionally add the divider if it's not the last item
                          if (index < items.length - 1)
                            const Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0),
                              child: Divider(height: 2),
                            ),
                        ],
                      );
                    }),
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
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromRGBO(255, 163, 132, 1),
        ),
        child: FloatingActionButton(
          splashColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DiaryAddPage()),
            );
          },
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(50)),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
