import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:platy/features/mainPage/main_seeMore_chart.dart';

class SeeMorePage extends StatefulWidget {
  const SeeMorePage({super.key});

  @override
  State<SeeMorePage> createState() => _SeeMorePageState();
}

class _SeeMorePageState extends State<SeeMorePage> {
  int dividerCount = 24;
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  void initState() {
    super.initState();
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
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Your progress',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Gilroy',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Overall progress',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: 'Gilroy',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset('assets/images/emojie_star.png'),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WOW !',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Gilroy',
                          ),
                        ),
                        Text(
                          'You are good! Keep up the good work',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gilroy',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 22),
              Container(
                width: MediaQuery.of(context).size.width * 1,
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
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 10.0, right: 8.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'You have been following your goal for ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Gilroy'),
                            ),
                            TextSpan(
                              text: '23',
                              style: TextStyle(
                                  color: Color(0xFFFC6C4C),
                                  fontSize: 20,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' days. ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Gilroy'),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '9',
                              style: TextStyle(
                                  color: Color(0xFFFC6C4C),
                                  fontSize: 20,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' days left until reaching goal !',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Gilroy'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      IntrinsicHeight(
                        child: SizedBox(
                          height: 18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for (int i = 0; i < dividerCount; i++)
                                const VerticalDivider(
                                    thickness: 3,
                                    width: 4,
                                    color: Color(0xFFFC6C4C)),
                              for (int i = 0; i < (31 - dividerCount); i++)
                                const VerticalDivider(
                                    thickness: 3,
                                    width: 4,
                                    color: Color.fromRGBO(23, 23, 23, 0.25)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 8.0),
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
                  Expanded(
                    flex: 1,
                    child: CircularPercentIndicator(
                      radius: 50,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 75 / 100,
                      center: const Text(
                        "${75}%",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                      backgroundColor: const Color(0x22242424),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: const Color(0xFFFC6C4C),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'GOAL',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Gilroy',
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '31',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Gilroy',
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 0.0),
                          child: Image.asset(
                            'assets/images/goal_frame.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
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
              Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFDB3D1A)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                        offset: Offset(1, 3),
                        blurRadius: 9,
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 1,
                  height: 85,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 8.0, right: 8.0, bottom: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hey !',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.74,
                                  child: const Text(
                                    "Today is an important day, don't miss your workout, go to the nutrition plan and follow it",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.09000000357627869),
                                  offset: Offset(1, 3),
                                  blurRadius: 9,
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward),
                              iconSize: 28,
                              padding: const EdgeInsets.all(0),
                              color: Colors.blue,
                            ),
                          ),
                        ]),
                  ),
                ),
                Positioned(
                  top: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: Stack(
                      children: [
                        CustomPaint(
                          painter: _ArrowPathPainter(
                              color: Colors.red, H: 12, W: 35),
                        ),
                        CustomPaint(
                          painter: _ArrowPathPainter(
                            color: Colors.white,
                            H: 10,
                            W: 33,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 24),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                      offset: Offset(1, 3),
                      blurRadius: 9,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
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
                          ),
                          const Text(
                            '89%',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 2000,
                        percent: 0.63,
                        barRadius: const Radius.circular(18),
                        progressColor: const Color.fromRGBO(137, 234, 103, 1),
                        backgroundColor: const Color.fromRGBO(23, 23, 23, 0.25),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                      offset: Offset(1, 3),
                      blurRadius: 9,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
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
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'Current Weight',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(36, 36, 36, 1),
                                  ),
                                ),
                              ),
                              Text(
                                '84.5',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 2000,
                        percent: 0.84,
                        barRadius: const Radius.circular(18),
                        progressColor: const Color.fromRGBO(137, 234, 103, 1),
                        backgroundColor: const Color.fromRGBO(23, 23, 23, 0.25),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Weight Chart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
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
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Jun 3 2022 - Aug 2023',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(36, 36, 36, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 250,
                        child: const WeightMainPageChart()),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Impact on the result',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: 206,
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
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                          child: Text(
                            'Negative',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 87, 87, 1),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 4.0, right: 3.0),
                              child: Image.asset(
                                'assets/images/smoking_frame.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            const Text(
                              'Smoking',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(
                            height: 6,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 4.0, right: 3.0),
                              child: Image.asset(
                                'assets/images/fastfood_frame.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            const Text(
                              'Fastfood',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: 206,
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
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                          child: Text(
                            'Positive',
                            style: TextStyle(
                              color: Color.fromRGBO(52, 168, 83, 1),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 4.0, right: 3.0),
                              child: Image.asset(
                                'assets/images/sleep_frame.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            const Text(
                              'Sleep',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(
                            height: 6,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 4.0, right: 3.0),
                              child: Image.asset(
                                'assets/images/regime_frame.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            const Text(
                              'Daily regime',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArrowPathPainter extends CustomPainter {
  final Color color;
  final double H;
  final double W;

  _ArrowPathPainter({required this.color, required this.H, required this.W});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double triangleH = H;
    double triangleW = W;
    final double width = size.width;
    final double height = size.height;

    final Path trianglePath = Path()
      ..moveTo(width / 2 - triangleW / 2, 0)
      ..lineTo(width / 2, -triangleH)
      ..lineTo(width / 2 + triangleW / 2, 0)
      ..lineTo(width / 2 - triangleW / 2, height);

    // Draw triangle pointer
    canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
