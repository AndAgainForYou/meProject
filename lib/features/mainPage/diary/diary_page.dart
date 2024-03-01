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
  List<Map<String, dynamic>> items = [];

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
    platyBloc.add(NotesGetAllEvent({}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Diary',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Write down your thoughts on this day',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    // border: Border.all(color: _isErrorVisible ? Colors.red : Colors.transparent),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                        offset: Offset(1, 3),
                        blurRadius: 9,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    maxLength: 25,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
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
                const SizedBox(height: 16),
                const Text(
                  'Previous 30 days',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                        offset: Offset(1, 3),
                        blurRadius: 9,
                      ),
                    ],
                  ),
                  child: Column(
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
                                          questionSelectedStates:
                                              createListParametrs(items[index]),
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
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            items[index]['added_at']
                                                    .split('-')[2] ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const Text('.'),
                                          Text(
                                            items[index]['added_at']
                                                    .split('-')[1] ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const Text('.'),
                                          Text(
                                            items[index]['added_at']
                                                    .split('-')[0] ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
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
                                      'assets/images/trash_red_icon.png',
                                      width: 24,
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            gradient: const LinearGradient(colors: [
              Color(0xFF59A7A7),
              Color(0xFFAFCD6D),
            ])),
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
