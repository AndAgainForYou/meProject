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
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  bool _showDetails = false;
  bool _showDetails2 = false;
  bool _showDetails3 = false;
  bool _showDetails4 = false;

  int _currentPageIndex = 0;

  int _days = 1;

  // Sample data
  List<Map<String, dynamic>> dataList = [
    {
      "day": 1,
      "meals": [
        {
          "title": "Breakfast",
          "meal_title": "DAY 1 DATA",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Duck",
              "amount": "30 g",
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
          "meal_title": "DAY 2 DATA",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Duck",
              "amount": "30 g",
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
      "day": 3,
      "meals": [
        {
          "title": "Breakfast",
          "meal_title": "DAY 3 DATA",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Duck",
              "amount": "30 g",
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
      "day": 4,
      "meals": [
        {
          "title": "Breakfast",
          "meal_title": "DAY 4 DATA",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Duck",
              "amount": "30 g",
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
      "day": 5,
      "meals": [
        {
          "title": "Breakfast",
          "meal_title": "DAY 5 DATA",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Duck",
              "amount": "30 g",
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
      "day": 6,
      "meals": [
        {
          "title": "Breakfast",
          "meal_title": "DAY 6 DATA",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Duck",
              "amount": "30 g",
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
      "day": 7,
      "meals": [
        {
          "title": "Breakfast",
          "meal_title": "DAY 7 DATA",
          "meal_calories": "590 kcal",
          "details": [
            {
              "name": "Duck",
              "amount": "30 g",
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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
              "calories": "137",
              "protein": "4 g",
              "fat": "9 g",
              "cholesterol": "0 mg",
              "calcium": "177 mg"
            },
            {
              "name": "Almond Milk (unsweetened)",
              "amount": "200 ml",
              "calories": "36",
              "protein": "1 g",
              "fat": "3 g",
              "cholesterol": "0 mg",
              "calcium": "79 mg"
            },
            {
              "name": "Strawberries",
              "amount": "100 g",
              "calories": "32",
              "protein": "1 g",
              "fat": "0 g",
              "cholesterol": "0 mg",
              "calcium": "16 mg"
            },
            {
              "name": "Whole Grain Oats",
              "amount": "40 g",
              "calories": "305",
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

  bool _alert = true;

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
                                  index + 1; // Adjust the day number
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
  children: dataList.map<Widget>((data) {
    if (data['day'] == _days) {
      // Display containers for the selected day
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: data['meals'].map<Widget>((meal) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      meal['title'],
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.50,
                                      child: Text(
                                        meal['meal_title'],
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  _getImagePathForTitle(meal['title']),
                                  width: 130,
                                  height: 130,
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: meal['title'] == 'Breakfast'
                                ? !_showDetails
                                : meal['title'] == 'Lunch'
                                    ? !_showDetails2
                                    : meal['title'] == 'Dinner'
                                        ? !_showDetails3
                                        : meal['title'] == 'Snack'
                                            ? !_showDetails4
                                            : false,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _toggleDetailsForTitle(meal['title']);
                                });
                              },
                              child: Center(
                                child: Icon(
                                  _getIconForTitle(meal['title'], meal['details']),
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _shouldShowDetails(meal['title']),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 16.0,
                                bottom: 2.0,
                                left: 16.0,
                              ),
                              child: Column(
                                children: [
                                  ...meal['details'].map<Widget>((detail) {
                                    return Column(
                                      children: [
                                        const Divider(),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              _currentPageIndex = 0;
                                            });
                                            _showModalBottomSheet(
                                              context,
                                              detail['name'],
                                              detail['amount'],
                                              detail['calories'],
                                              detail['protein'],
                                              detail['fat'],
                                              detail['cholesterol'],
                                              detail['calcium'],
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12.0),
                                                  gradient: const LinearGradient(
                                                    begin: Alignment(-0.5, -1.0),
                                                    end: Alignment(0.5, 1.0),
                                                    colors: [
                                                      Color.fromRGBO(205, 201, 196, 0.24),
                                                      Color.fromRGBO(205, 201, 196, 0.24),
                                                    ],
                                                    stops: [0.0, 1.0],
                                                  ),
                                                ),
                                                padding: const EdgeInsets.all(8),
                                                child: const Center(
                                                  child: Column(
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
                                        const SizedBox(height: 5),
                                      ],
                                    );
                                  }).toList(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _toggleDetailsForTitle(meal['title']);
                                      });
                                    },
                                    child: Center(
                                      child: Icon(
                                        _getIconForTitle(meal['title'], meal['details']),
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
