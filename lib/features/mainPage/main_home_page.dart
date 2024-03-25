import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:platy/features/bloc/platy_bloc_bloc.dart';
import 'package:platy/features/mainPage/diary/diary_page.dart';
import 'package:platy/features/mainPage/main_seeMore_page.dart';
import 'package:platy/features/mainPage/myMealPlan/meal_plan_page.dart';
import 'package:platy/features/mainPage/profile/profile_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();
  late final List<ScrollController> _scrollControllers;

  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollControllers = List.generate(4, (_) => ScrollController());
    _scrollControllers.forEach((controller) {
      controller.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    _scrollControllers.forEach((controller) {
      controller.removeListener(_onScroll);
      controller.dispose();
    });
    super.dispose();
  }

  void _onScroll() {
    if (_selectedIndex >= 0 && _selectedIndex < _scrollControllers.length) {
      final selectedController = _scrollControllers[_selectedIndex];
      if (selectedController.hasClients) {
        if (selectedController.offset > 50 && !_isScrolled) {
          setState(() {
            _isScrolled = true;
          });
        } else if (selectedController.offset <= 50 && _isScrolled) {
          setState(() {
            _isScrolled = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          MainHome(
              scrollController: _scrollControllers[0], isScrolled: _isScrolled),
          const MealPlanPage(),
          const DiaryPage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.09),
              offset: Offset(1, 3),
              blurRadius: 9,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/home.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 0
                    ? const Color(0xFFFC6C4C)
                    : Colors.black26,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/book-open.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 1
                    ? const Color(0xFFFC6C4C)
                    : Colors.black54,
              ),
              label: 'My Meal Plan',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/book.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 2
                    ? const Color(0xFFFC6C4C)
                    : Colors.black54,
              ),
              label: 'Diary',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/user_menu.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 3
                    ? const Color(0xFFFC6C4C)
                    : Colors.black54,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          iconSize: 24,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10,
            fontFamily: 'Gilroy',
          ),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10,
            fontFamily: 'Gilroy',
          ),
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          selectedItemColor: const Color(0xFFFC6C4C),
          backgroundColor: const Color.fromARGB(255, 240, 242, 236),
          unselectedItemColor: Colors.black54,
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}

class MainHome extends StatefulWidget {
  final ScrollController scrollController;
  final bool isScrolled;

  const MainHome(
      {Key? key, required this.scrollController, required this.isScrolled})
      : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', "S"];

  bool _showDetails = false;
  bool _showDetails2 = false;
  bool _showDetails3 = false;
  bool _showDetails4 = false;

  int _currentPageIndex = 0;

  int _days = 0;

  // Sample data
  List<Map<String, dynamic>> dataList = [
     {
    "meals": [
      {
        "details": [
          {
            "name": "Grilled Avocado and Spinach",
            "amount": "200 g",
            "calories": "240 kcal"
          },
          {
            "name": "Blackberries",
            "amount": "100 g",
            "calories": "43 kcal"
          },
          {
            "name": "Grilled Tofu",
            "amount": "75 g",
            "calories": "117 kcal"
          }
        ],
        "mealType": "Breakfast",
        "energyValue": "400 kcal"
      },
      {
        "details": [
          {
            "name": "Grilled Mixed Vegetables",
            "amount": "300 g",
            "calories": "180 kcal"
          },
          {
            "name": "Grilled Quinoa Stuffed Bell Peppers",
            "amount": "250 g",
            "calories": "320 kcal"
          }
        ],
        "mealType": "Dinner",
        "energyValue": "500 kcal"
      }
    ],
    "weekDay": "Sunday"
  },
  {
    "meals": [
      {
        "details": [
          {
            "name": "Grilled Mushrooms",
            "amount": "160 g",
            "calories": "70 kcal"
          },
          {
            "name": "Grilled Asparagus",
            "amount": "150 g",
            "calories": "90 kcal"
          },
          {
            "name": "Grilled Tomato",
            "amount": "150 g",
            "calories": "30 kcal"
          },
          {
            "name": "Grilled Soy Sausage",
            "amount": "75 g",
            "calories": "260 kcal"
          }
        ],
        "mealType": "Breakfast",
        "energyValue": "450 kcal"
      },
      {
        "details": [
          {
            "name": "Grilled Corn and Black Bean Salad",
            "amount": "300 g",
            "calories": "360 kcal"
          },
          {
            "name": "Grilled Chickpeas",
            "amount": "100 g",
            "calories": "160 kcal"
          }
        ],
        "mealType": "Dinner",
        "energyValue": "520 kcal"
      }
    ],
    "weekDay": "Monday"
  },
  {
    "meals": [
      {
        "details": [
          {
            "name": "Grilled Tempeh and Kale Salad",
            "amount": "300 g",
            "calories": "300 kcal"
          },
          {
            "name": "Grilled Berry Skewers",
            "amount": "150 g",
            "calories": "130 kcal"
          }
        ],
        "mealType": "Breakfast",
        "energyValue": "430 kcal"
      },
      {
        "details": [
          {
            "name": "Grilled Falafel Patties",
            "amount": "200 g",
            "calories": "300 kcal"
          },
          {
            "name": "Grilled Lentil Stuffed Bell Pepper",
            "amount": "250 g",
            "calories": "200 kcal"
          }
        ],
        "mealType": "Dinner",
        "energyValue": "500 kcal"
      }
    ],
    "weekDay": "Tuesday"
  },
  {
    "meals": [
      {
        "details": [
          {
            "amount": "200 g",
            "calories": "90 kcal"
          },
          {
            "name": "Grilled Tofu Scramble",
            "amount": "250 g",
            "calories": "310 kcal"
          }
        ],
        "mealType": "Breakfast",
        "energyValue": "400 kcal"
      },
      {
        "details": [
          {
            "name": "Grilled Brussels Sprouts",
            "amount": "200 g",
            "calories": "160 kcal"
          },
          {
            "name": "Grilled Seitan Steak",
            "amount": "250 g",
            "calories": "340 kcal"
          }
        ],
        "mealType": "Dinner",
        "energyValue": "500 kcal"
      }
    ],
    "weekDay": "Wednesday"
  },
  {
    "meals": [
      {
        "details": [
          {
            "name": "Grilled Veggie Hash",
            "amount": "300 g",
            "calories": "220 kcal"
          },
          {
            "name": "Grilled Pineapple",
            "amount": "200 g",
            "calories": "190 kcal"
          }
        ],
        "mealType": "Breakfast",
        "energyValue": "410 kcal"
      },
      {
        "details": [
          {
            "name": "Grilled Zucchini and Eggplant",
            "amount": "250 g",
            "calories": "160 kcal"
          },
          {
            "name": "Grilled Portobello Mushroom Burger",
            "amount": "250 g",
            "calories": "350 kcal"
          }
        ],
        "mealType": "Dinner",
        "energyValue": "510 kcal"
      }
    ],
    "weekDay": "Thursday"
  },
  {
    "meals": [
      {
        "details": [
          {
            "name": "Grilled Veggie Scramble",
            "amount": "250 g",
            "calories": "220 kcal"
          },
          {
            "name": "Grilled Baby Potatoes",
            "amount": "200 g",
            "calories": "180 kcal"
          }
        ],
        "mealType": "Breakfast",
        "energyValue": "400 kcal"
      },
      {
        "details": [
          {
            "name": "Grilled Lentil and Veggies Skewers",
            "amount": "300 g",
            "calories": "300 kcal"
          },
          {
            "name": "Grilled Squash",
            "amount": "200 g",
            "calories": "200 kcal"
          }
        ],
        "mealType": "Dinner",
        "energyValue": "500 kcal"
      }
    ],
    "weekDay": "Friday"
  },
  {
    "meals": [
      {
        "details": [
          {
            "name": "Grilled Banana and Blueberries",
            "amount": "200 g",
            "calories": "170 kcal"
          },
          {
            "name": "Grilled Vegan Sausage",
            "amount": "150 g",
            "calories": "250 kcal"
          }
        ],
        "mealType": "Breakfast",
        "energyValue": "420 kcal"
      },
      {
        "details": [
          {
            "name": "Grilled Caramelized Onion and Mushroom Sandwich",
            "amount": "300 g"
          },
          {
            "name": "Grilled Sweet Potato",
            "amount": "200 g",
            "calories": "200 kcal"
          }
        ],
        "mealType": "Dinner",
        "energyValue": "520 kcal"
      }
    ],
    "weekDay": "Saturday"
  }


  ];

  bool _alert = true;

  IconData _getIconForTitle(String title, List<dynamic> details) {
    switch (title) {
      case 'Breakfast':
        return !_showDetails
            ? Icons.keyboard_arrow_up
            : Icons.keyboard_arrow_down;
      case 'Lunch':
        return !_showDetails2
            ? Icons.keyboard_arrow_up
            : Icons.keyboard_arrow_down;
      case 'Dinner':
        return !_showDetails3
            ? Icons.keyboard_arrow_up
            : Icons.keyboard_arrow_down;
      case 'Snack':
        return !_showDetails4
            ? Icons.keyboard_arrow_up
            : Icons.keyboard_arrow_down;
      default:
        return Icons.keyboard_arrow_down;
    }
  }

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
    BlocProvider.of<PlatyBloc>(context).add(MealPlanDataEvent([]));
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

  final dataMap = <String, double>{
    "Protein": 1,
    "Fat": 5,
    "Cholesterol": 0,
    "Calcium": 143,
  };

  final colorList = <Color>[
    const Color.fromRGBO(255, 242, 204, 1),
    const Color.fromRGBO(255, 217, 102, 1),
    const Color.fromRGBO(244, 177, 131, 1),
    const Color.fromRGBO(223, 166, 123, 1),
  ];

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatyBloc, PlatyBlocState>(
      builder: (context, state) {
        if (state is MealPlanDataState) {
          List<Map<String, dynamic>> dataFromJson = state.successMessage;
          print('Data: $dataFromJson');
          dataList = dataFromJson;
        }
        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background_noOrange.png',
                fit: BoxFit.cover,
              ),
            ),
            CustomScrollView(
              controller: widget.scrollController,
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
                  backgroundColor: widget.isScrolled
                      ? const Color.fromARGB(255, 240, 242, 236)
                      : Colors.transparent,
                  floating: true,
                  pinned: true,
                  snap: false,
                  elevation: 0,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Goal',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          Visibility(
                              visible: _alert,
                              child: const SizedBox(height: 10)),
                          Visibility(
                            visible: _alert,
                            child: Container(
                              constraints: BoxConstraints(
                                maxHeight: 72,
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
                              child: Padding(
                                padding: const EdgeInsets.only(left: 17.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'WOW!',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          'You are good! Keep up the good work',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.cancel),
                                      onPressed: () {
                                        // Add your cancel action here
                                        setState(() {
                                          _alert = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 0.0, top: 0.0),
                                child: CircularPercentIndicator(
                                    backgroundColor:
                                        const Color.fromRGBO(230, 227, 223, 1),
                                    radius: 100,
                                    lineWidth: 16.0,
                                    percent: 0.89,
                                    center: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("89%",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF535355))),
                                        Text(
                                          'Daily progress',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                    linearGradient: const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: <Color>[
                                          Color(0xFFa4aa9c),
                                          Color(0xFFffa384),
                                          Color(0xFFffa384),
                                          Color(0xFFffa384),
                                          Color(0xFFffa384),
                                          Color(0xFFffa384),
                                          Color(0xFFa4aa9c),
                                          Color(0xFFa4aa9c),
                                          Color(0xFFa4aa9c),
                                        ]),
                                    rotateLinearGradient: true,
                                    circularStrokeCap: CircularStrokeCap.round),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.36,
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'My current track',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '23',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'My current goal',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '3 times (weekly)',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Divider(),
                                    SizedBox(height: 5),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Current weight',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '84.5',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Target weight',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '95',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 50),
                          GestureDetector(
                            onTap: () {
                              PlatyBloc platyBloc =
                                  BlocProvider.of<PlatyBloc>(context);
                              // platyBloc.add(MealPlanDataEvent());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SeeMorePage()),
                              );
                            },
                            child: Container(
                              constraints: const BoxConstraints(
                                maxHeight: 44,
                                maxWidth: 131,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                // ignore: prefer_const_constructors
                                gradient: LinearGradient(
                                  begin: const Alignment(0.0, -1.0),
                                  end: const Alignment(1.0, 1.0),
                                  colors: const [
                                    Color.fromRGBO(164, 171, 155, 1),
                                    Color.fromRGBO(164, 171, 155, 1),
                                  ],
                                  stops: const [0.0, 1.0],
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
                                  'See More',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Gilroy',
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            'Your meal plan',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(days.length, (index) {
                              final int dayNumber =
                                  index ; // Adjust the day number
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _days = dayNumber;
                                    _showDetails = false;
                                    _showDetails2 = false;
                                    _showDetails3 = false;
                                    _showDetails4 =
                                        false; // Update _days with the adjusted day number
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
                                                  Color.fromRGBO(
                                                      164, 171, 155, 1),
                                                  Color.fromRGBO(
                                                      164, 171, 155, 1),
                                                ],
                                              )
                                            : null,
                                        color: dayNumber != _days
                                            ? Colors.white
                                            : null,
                                      ),
                                      child: Center(
                                        child: Text(
                                          days[index],
                                          style: TextStyle(
                                            color: dayNumber == _days
                                                ? Colors.white
                                                : Colors.black38,
                                            fontSize: 16,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 30),



Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: dataList.isNotEmpty ? (dataList[_days]['meals'] as List<dynamic>).map<Widget>((meal) {
    if (meal.containsKey('details') && meal.containsKey('mealType')) {
      List<dynamic> details = meal['details'];
      String? mealType = meal['mealType'];
      String? energyValue = meal['energyValue'];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (mealType != null && energyValue != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$mealType',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '$energyValue',
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Image.asset(
                            _getImagePathForTitle(mealType),
                            width: 130,
                            height: 130,
                          ),
                        ],
                      ),
                      Visibility(
                        visible: mealType == 'Breakfast'
                            ? !_showDetails
                            : mealType == 'Lunch'
                                ? !_showDetails2
                                : mealType == 'Dinner'
                                    ? !_showDetails3
                                    : mealType == 'Snack'
                                        ? !_showDetails4
                                        : false,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _toggleDetailsForTitle(mealType);
                            });
                          },
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: mealType == 'Breakfast'
                            ? _showDetails
                            : mealType == 'Lunch'
                                ? _showDetails2
                                : mealType == 'Dinner'
                                    ? _showDetails3
                                    : mealType == 'Snack'
                                        ? _showDetails4
                                        : false,
                        child: Column(
                          children: [
                            ...details.map<Widget>((detail) {
                              String? name = detail['name'];
                              String? amount = detail['amount'];
                              String? calories = detail['calories'];

                              if (name != null) {
                                return Visibility(
                                  visible: true,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0,  right: 25.0, bottom: 15.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.63,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ListTile(
                                                  
                                                  horizontalTitleGap: 0,
                                                  subtitle:  Text('$amount', style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                
                                              ),),
                                                  title:   Text(name,  style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                height: 1.1
                                              ),),
                                                ),
                                              
                                             
                                               
                                              ],
                                            ),
                                          ),
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
                                                                            child: Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                  Text(
                                                                                    '${calories?.replaceAll(' kcal', '')}',
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
                                       )
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            }).toList(),
                            Visibility(
                              visible: mealType == 'Breakfast'
                                  ? _showDetails
                                  : mealType == 'Lunch'
                                      ? _showDetails2
                                      : mealType == 'Dinner'
                                          ? _showDetails3
                                          : mealType == 'Snack'
                                              ? _showDetails4
                                              : false,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _toggleDetailsForTitle(mealType);
                                  });
                                },
                                child: const Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_up,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }).toList() : [Container()], // If dataList is empty, return an empty Container
)






                          
                        ],
                      ),
                    ),

                    // Add more widgets here if needed
                  ]),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _showModalBottomSheet(BuildContext context, name, amount, calories,
      protein, fat, cholesterol, calcium) {
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
                                        '${calories}',
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
                                Text(' ${calories}'),
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
                          const Text(
                            '100 g',
                            style: TextStyle(fontSize: 12),
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
