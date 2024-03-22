import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';

class MealPlanPage extends StatefulWidget {
  const MealPlanPage({Key? key}) : super(key: key);

  @override
  State<MealPlanPage> createState() => _MealPlanPageState();
}

class _MealPlanPageState extends State<MealPlanPage> {
  late final ScrollController _scrollController;
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  //late List<Map<String, dynamic>> mealPlan = [];

  bool _showDetails = false;
  bool _showDetails2 = false;
  bool _showDetails3 = false;
  bool _showDetails4 = false;

  int _currentPageIndex = 0;

  int _days = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    bool isScrolled =
        _scrollController.hasClients && _scrollController.offset > 0;
    setState(() {});
  }

  static const Map<String, dynamic> modalData = {
    "nutritionalInfo": [
      {"name": "kcal", "value": "283"},
      {"name": "Protein", "value": "1 gr"},
      {"name": "Fat", "value": "5 gr"},
      {"name": "Cholesterol", "value": "0 gr"},
      {"name": "Calcium", "value": "146 mg"}
    ]
  };

  final List<Map<String, dynamic>> dataList = [
    {
      "day": 1,
      "meals": [
        {
          "title": "Breakfast",
          "meal_title": "Chia Seed Pudding with Almond Milk",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Dick",
              "amount": "30 g",
              "calories": "137 kcal",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36 kcal",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32 kcal",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305 kcal",
              "protein": "10 g",
              "fat": "5 g",
              "cholesterol": "0 mg",
              "calcium": "52 mg"
            }
          ]
        },
        {
          "title": "Lunch",
          "meal_title": "Chia Seed Pudding with Almond Milk",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Chia Seeds",
              "amount": "30 g",
              "calories": "137 kcal",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36 kcal",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32 kcal",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305 kcal",
              "protein": "10 g",
              "fat": "5 g",
              "cholesterol": "0 mg",
              "calcium": "52 mg"
            }
          ]
        },
        {
          "title": "Dinner",
          "meal_title": "Chia Seed Pudding with Almond Milk",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Chia Seeds",
              "amount": "30 g",
              "calories": "137 kcal",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36 kcal",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32 kcal",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305 kcal",
              "protein": "10 g",
              "fat": "5 g",
              "cholesterol": "0 mg",
              "calcium": "52 mg"
            }
          ]
        },
        {
          "title": "Snack",
          "meal_title": "Chia Seed Pudding with Almond Milk",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Chia Seeds",
              "amount": "30 g",
              "calories": "137 kcal",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36 kcal",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32 kcal",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305 kcal",
              "protein": "10 g",
              "fat": "5 g",
              "cholesterol": "0 mg",
              "calcium": "52 mg"
            }
          ]
        }
      ]
    },
    {
      "day": 2,
      "meals": [
        {
          "title": "Breakfast",
          "meal_title": "Chia Seed Pudding with Almond Milk",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Dick",
              "amount": "30 g",
              "calories": "137 kcal",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36 kcal",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32 kcal",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305 kcal",
              "protein": "10 g",
              "fat": "5 g",
              "cholesterol": "0 mg",
              "calcium": "52 mg"
            }
          ]
        },
        {
          "title": "Lunch",
          "meal_title": "Chia Seed Pudding with Almond Milk",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Chia Seeds",
              "amount": "30 g",
              "calories": "137 kcal",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36 kcal",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32 kcal",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305 kcal",
              "protein": "10 g",
              "fat": "5 g",
              "cholesterol": "0 mg",
              "calcium": "52 mg"
            }
          ]
        },
        {
          "title": "Dinner",
          "meal_title": "Chia Seed Pudding with Almond Milk",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Chia Seeds",
              "amount": "30 g",
              "calories": "137 kcal",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36 kcal",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32 kcal",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305 kcal",
              "protein": "10 g",
              "fat": "5 g",
              "cholesterol": "0 mg",
              "calcium": "52 mg"
            }
          ]
        },
        {
          "title": "Snack",
          "meal_title": "Chia Seed Pudding with Almond Milkkkk",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Chia",
              "amount": "30 g",
              "calories": "137 kcal",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36 kcal",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32 kcal",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305 kcal",
              "protein": "10 g",
              "fat": "5 g",
              "cholesterol": "0 mg",
              "calcium": "52 mg"
            }
          ]
        }
      ]
    }
  ];

  final dataMap = <String, double>{
    "Protein": 1,
    "Fat": 5,
    "Cholesterol": 0,
    "Calcium": 143,
  };

  IconData _getIconForTitle(String title, List<dynamic> details) {
    switch (title) {
      case 'Breakfast':
        return _showDetails
            ? Icons.keyboard_arrow_up
            : Icons.keyboard_arrow_down;
      case 'Lunch':
        return _showDetails2
            ? Icons.keyboard_arrow_up
            : Icons.keyboard_arrow_down;
      case 'Dinner':
        return _showDetails3
            ? Icons.keyboard_arrow_up
            : Icons.keyboard_arrow_down;
      case 'Snack':
        return _showDetails4
            ? Icons.keyboard_arrow_up
            : Icons.keyboard_arrow_down;
      default:
        return Icons.keyboard_arrow_down;
    }
  }

  bool _shouldShowDetails(String title) {
    switch (title) {
      case 'Breakfast':
        return _showDetails;
      case 'Lunch':
        return _showDetails2;
      case 'Dinner':
        return _showDetails3;
      case 'Snack':
        return _showDetails4;
      default:
        return false;
    }
  }

  final colorList = <Color>[
    const Color.fromRGBO(255, 242, 204, 1),
    const Color.fromRGBO(255, 217, 102, 1),
    const Color.fromRGBO(244, 177, 131, 1),
    const Color.fromRGBO(223, 166, 123, 1),
  ];

  void _incrementDays() {
    setState(() {
      if (_days < 7) {
        _days++;
      }
      ;
      _showDetails = false;
      _showDetails2 = false;
      _showDetails3 = false;
      _showDetails4 = false;
    });
  }

  void _decrementDays() {
    setState(() {
      if (_days > 0) {
        _days--;
      }
      ;
      _showDetails = false;
      _showDetails2 = false;
      _showDetails3 = false;
      _showDetails4 = false;
    });
  }

  String _getImagePathForTitle(String title) {
    switch (title) {
      case 'Breakfast':
        return 'assets/images/sun.png';
      case 'Lunch':
        return 'assets/images/l.png';
      case 'Dinner':
        return 'assets/images/D.png';
      case 'Snack':
        return 'assets/images/s.png';
      default:
        return 'assets/images/s.png'; // Default image path
    }
  }

  void _toggleDetailsForTitle(String title) {
    setState(() {
      switch (title) {
        case 'Breakfast':
          _showDetails = !_showDetails;
          break;
        case 'Lunch':
          _showDetails2 = !_showDetails2;
          break;
        case 'Dinner':
          _showDetails3 = !_showDetails3;
          break;
        case 'Snack':
          _showDetails4 = !_showDetails4;
          break;
      }
    });
  }

  int getTodayDayNumber() {
  DateTime now = DateTime.now();
  return now.day;
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlatyBloc, PlatyBlocState>(
        builder: (context, state) {
          if (state is MealPlanDataState) {
            //Map<String, dynamic> profileData = state.profilePageData;
            //emailText = profileData['user_email'];
          }
          return Stack(children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background_noOrange.png',
                fit: BoxFit.cover,
              ),
            ),
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 0,
                  expandedHeight: 0.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.transparent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  title: Image.asset('assets/images/logo_small.png',
                      width: 32, height: 32),
                  actions: [
                    IconButton(
                      icon: Image.asset('assets/images/black_bell.png',
                          width: 42, height: 42),
                      onPressed: () {
                        // Add your action here
                      },
                    ),
                  ],
                  backgroundColor: _scrollController.hasClients &&
                          _scrollController.offset > 0
                      ? const Color.fromARGB(255, 240, 242, 236)
                      : Colors.transparent,
                  floating: true,
                  pinned: true,
                  snap: false,
                  elevation: 0,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Your personal meal plan',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Let's customize your nutrition",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: 92,
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.92,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.09000000357627869),
                                  offset: Offset(1, 3),
                                  blurRadius: 9,
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 17.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "View favorites and past meal plans",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: 20.0, left: 15),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: 92,
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.92,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.09000000357627869),
                                  offset: Offset(1, 3),
                                  blurRadius: 9,
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 17.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Request recommendations for improving nutrition",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: 20.0, left: 15),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),

                          
                          Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: List.generate(days.length, (index) {
    final int dayNumber = index + 1; // Adjust the day number
    return GestureDetector(
      onTap: () {
        setState(() {
          _days = dayNumber;
          _showDetails = false;
      _showDetails2 = false;
      _showDetails3 = false;
      _showDetails4 = false; // Update _days with the adjusted day number
        });
      },
      child: Column(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: dayNumber == _days
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(164, 171, 155, 1),
                        Color.fromRGBO(164, 171, 155, 1),
                      ],
                    )
                  : null,
              color: dayNumber != _days ? Colors.white : null,
            ),
            child: Center(
              child: Text(
                days[index],
                style: TextStyle(
                  color: dayNumber == _days ? Colors.white : Colors.black38,
                  fontSize: 16,
                  fontFamily: 'Gilroy',
                ),
              ),
            ),
          ),
          Text(
            (dayNumber).toString(), // show it here
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }),
),



                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  _decrementDays();
                                },

                                ///to do
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 18,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '$_days',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const Text(
                                    ' / ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Text(
                                    '7',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  _incrementDays();
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),




                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: dataList.map<Widget>((data) {
                              if (data['day'] == _days) {
                                // Display containers for the selected day
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Column(
                                        children:
                                            data['meals'].map<Widget>((meal) {
                                          return Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                meal['title'],
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.50,
                                                                child: Text(
                                                                  meal[
                                                                      'meal_title'],
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Image.asset(
                                                            _getImagePathForTitle(
                                                                meal['title']),
                                                            width: 140,
                                                            height: 140,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: meal['title'] ==
                                                              'Breakfast'
                                                          ? !_showDetails
                                                          : meal['title'] ==
                                                                  'Lunch'
                                                              ? !_showDetails2
                                                              : meal['title'] ==
                                                                      'Dinner'
                                                                  ? !_showDetails3
                                                                  : meal['title'] ==
                                                                          'Snack'
                                                                      ? !_showDetails4
                                                                      : false,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            _toggleDetailsForTitle(
                                                                meal['title']);
                                                          });
                                                        },
                                                        child: Center(
                                                          child: Icon(
                                                            _getIconForTitle(
                                                                meal['title'],
                                                                meal[
                                                                    'details']),
                                                            size: 30,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (_shouldShowDetails(
                                                        meal['title']))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          right: 16.0,
                                                          bottom: 2.0,
                                                          left: 16.0,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            ...meal['details']
                                                                .map<Widget>(
                                                                    (detail) {
                                                              return Column(
                                                                children: [
                                                                  const Divider(),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        _currentPageIndex =
                                                                            0;
                                                                      });
                                                                       _showModalBottomSheet(
                                                                    context,
                                                                    detail[
                                                                        'name'],
                                                                        detail[
                                                                        'amount'],
                                                                        detail[
                                                                        'calories'],
                                                                         detail[
                                                                        'protein'],
                                                                         detail[
                                                                        'fat'],
                                                                        detail[
                                                                        'cholesterol'],
                                                                        detail[
                                                                        'calcium'],
                                                                  );
                                                                    },
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              detail['name'],
                                                                              style: const TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              detail['amount'],
                                                                              style: const TextStyle(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: Colors.grey,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            gradient:
                                                                                const LinearGradient(
                                                                              begin: Alignment(-0.5, -1.0),
                                                                              end: Alignment(0.5, 1.0),
                                                                              colors: [
                                                                                Color.fromRGBO(205, 201, 196, 0.24),
                                                                                Color.fromRGBO(205, 201, 196, 0.24),
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8),
                                                                          child:
                                                                              const Center(
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  '283',
                                                                                  style: TextStyle(
                                                                                    fontSize: 12,
                                                                                    fontWeight: FontWeight.w400,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'kcal',
                                                                                  style: TextStyle(
                                                                                    fontSize: 12,
                                                                                    fontWeight: FontWeight.w400,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          5),
                                                                ],
                                                              );
                                                            }).toList(),
                                                           GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            _toggleDetailsForTitle(
                                                                meal['title']);
                                                          });
                                                        },
                                                        child: Center(
                                                          child: Icon(
                                                            _getIconForTitle(
                                                                meal['title'],
                                                                meal[
                                                                    'details']),
                                                            size: 30,
                                                          ),
                                                        ),
                                                      ),
                                                    
                                                          ],
                                                          
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                  ],
                                );
                              } else {
                                // Return empty container for other days
                                return Container();
                              }
                            }).toList(),
                          ),




                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.445,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    border: Border.all(
                                      color: const Color.fromRGBO(
                                          164, 171, 155, 1),
                                      width: 2.0,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Add a note',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(164, 171, 155, 1),
                                    ),
                                  )),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.445,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    border: Border.all(
                                      color: const Color.fromRGBO(
                                          164, 171, 155, 1),
                                      width: 2.0,
                                    ),
                                    color:
                                        const Color.fromRGBO(164, 171, 155, 1),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Save meal plan',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )
                  ]),
                )
              ],
            ),
          ]);
        },
      ),
    );
  }

    void _showModalBottomSheet(BuildContext context, name, amount, calories, protein, fat, cholesterol, calcium) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 380,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 18.0, bottom: 40.0, left: 10.0, right: 5.0),
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                      print(_currentPageIndex);
                    },
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color:
                                      const Color.fromRGBO(205, 201, 196, 0.24),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 6.0,
                                    bottom: 6.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${calories.split(' ')[0]}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Text(
                                        'kcal',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(),
                                child:  Padding(
                                  padding: const EdgeInsets.only(
                                    top: 6.0,
                                    bottom: 6.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$protein',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Text(
                                        'Protein',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color.fromRGBO(230, 227, 223, 1),
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 6.0,
                                    bottom: 6.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$fat',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Text(
                                        'Fat',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color.fromRGBO(230, 227, 223, 1),
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 6.0,
                                    bottom: 6.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$cholesterol',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Text(
                                        'Cholesterol',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color.fromRGBO(230, 227, 223, 1),
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 6.0,
                                    bottom: 6.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$calcium',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Text(
                                        'Calcium',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 100.0, bottom: 100.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: PieChart(
                            dataMap: dataMap,
                            ringStrokeWidth: 15,
                            chartLegendSpacing: 110,
                            chartType: ChartType.ring,
                            baseChartColor: Colors.grey!.withOpacity(0.15),
                            colorList: colorList,
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValues: false,
                            ),
                            totalValue: 152,
                            legendOptions: const LegendOptions(
                                legendShape: BoxShape.rectangle,
                                legendTextStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                            centerWidget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(' ${calories.split(' ')[0]}'),
                                const Text(
                                  'kcal',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        weight: 24,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '$amount',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          2, // Кількість сторінок
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPageIndex == index
                                  ? Colors.orange
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
