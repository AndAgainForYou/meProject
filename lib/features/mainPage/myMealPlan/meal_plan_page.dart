import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MealPlanPage extends StatefulWidget {
  const MealPlanPage({super.key});

  @override
  State<MealPlanPage> createState() => _MealPlanPageState();
}

class _MealPlanPageState extends State<MealPlanPage> {
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(32),
  );

  final kGradientBoxDecoration = BoxDecoration(
    gradient:
        const LinearGradient(colors: [Color(0xFF59A7A7), Color(0xFFAFCD6D)]),
    border: Border.all(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(32),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Your Meal Plan',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Let's customize your nutrition",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 75,
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
                      image: const DecorationImage(
                          image: AssetImage('assets/images/group_meal.png'),
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.centerLeft)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.24,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'View favorites and \npast meal plans',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward),
                          iconSize: 28,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 75,
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
                      image: const DecorationImage(
                          image:
                              AssetImage('assets/images/group_second_meal.png'),
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.centerLeft)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.24,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Request recommendations \nfor improving nutrition',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward),
                          iconSize: 28,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < days.length; i++)
                      Column(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: i == 0
                                ? const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFFF8064),
                                        Color(0xFFDB3D1A),
                                      ],
                                    ),
                                  )
                                : const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(23, 23, 23, 0.25),
                                  ),
                            child: Center(
                              child: Text(
                                days[i],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Gilroy',
                                ),
                              ),
                            ),
                          ),
                          Text(
                            (i + 11).toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Gilroy',
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Daily progress',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          '89 %',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      animation: true,
                      lineHeight: 16.0,
                      animationDuration: 2000,
                      percent: 0.89,
                      barRadius: const Radius.circular(18),
                      progressColor: const Color.fromRGBO(137, 234, 103, 1),
                      backgroundColor: const Color.fromRGBO(23, 23, 23, 0.25),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: 64,
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
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Image.asset(
                              'assets/images/days_left_frame.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Days Left',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Gilroy',
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '23',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Gilroy',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: 64,
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
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Image.asset(
                              'assets/images/workout_frame.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Workout Target',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Gilroy',
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '3 times (weekly)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Gilroy',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: 64,
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
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Image.asset(
                              'assets/images/current_weight_frame.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Current weight',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Gilroy',
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '84.5',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Gilroy',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: 64,
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
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Image.asset(
                              'assets/images/target_weight_frame.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Target weight',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Gilroy',
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '95',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Gilroy',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Breakfast',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Gilroy',
                      ),
                    ),
                    Text(
                      '06:00 AM',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontFamily: 'Gilroy',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 99,
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
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/food_frame.png',
                        width: 95,
                        height: 95,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Tofu',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Gilroy',
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(19),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFF59A7A7),
                                          Color(0xFFAFCD6D),
                                        ],
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0.0, right: 10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 2.0),
                                            child: Image.asset(
                                                'assets/images/mingcute_lightning-fill.png'),
                                          ),
                                          const Text(
                                            '100 g – 80-100 kcal',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 2),
                              const Divider(
                                height: 2,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Protein',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '1 gr',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Cholesterol',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '0 gr',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Fat',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '5 gr',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Calcium',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '146 mg',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
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
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 99,
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
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/food_frame.png',
                        width: 95,
                        height: 95,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Tofu',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Gilroy',
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(19),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFF59A7A7),
                                          Color(0xFFAFCD6D),
                                        ],
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0.0, right: 10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 2.0),
                                            child: Image.asset(
                                                'assets/images/mingcute_lightning-fill.png'),
                                          ),
                                          const Text(
                                            '100 g – 80-100 kcal',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 2),
                              const Divider(
                                height: 2,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Protein',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '1 gr',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Cholesterol',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '0 gr',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Fat',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '5 gr',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Calcium',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '146 mg',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
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
                const SizedBox(height: 32),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Lunch',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Gilroy',
                      ),
                    ),
                    Text(
                      '09:00 AM',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontFamily: 'Gilroy',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 99,
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
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/food_frame.png',
                        width: 95,
                        height: 95,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Tofu',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Gilroy',
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(19),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFF59A7A7),
                                          Color(0xFFAFCD6D),
                                        ],
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0.0, right: 10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 2.0),
                                            child: Image.asset(
                                                'assets/images/mingcute_lightning-fill.png'),
                                          ),
                                          const Text(
                                            '100 g – 80-100 kcal',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 2),
                              const Divider(
                                height: 2,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Protein',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '1 gr',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Cholesterol',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '0 gr',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Fat',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '5 gr',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Calcium',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '146 mg',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                      ],
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
                const SizedBox(height: 24),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 52.0,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: kGradientBoxDecoration,
                            child: Container(
                              decoration: kInnerDecoration,
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6.0),
                                    child: Image.asset(
                                        'assets/images/save_vector.png'),
                                  ),
                                  const Text(
                                    "Save meal plan",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 52.0,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: kGradientBoxDecoration,
                            child: Container(
                              decoration: kInnerDecoration,
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6.0),
                                    child: Image.asset(
                                        'assets/images/bookmark_vector.png'),
                                  ),
                                  const Text(
                                    "Add a note",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
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
                            'Next',
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
                    const SizedBox(height: 8),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
