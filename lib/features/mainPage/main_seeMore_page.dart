import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SeeMorePage extends StatefulWidget {
  const SeeMorePage({Key? key}) : super(key: key);

  @override
  State<SeeMorePage> createState() => _SeeMorePageState();
}

class _SeeMorePageState extends State<SeeMorePage> {
  int dividerCount = 24;
  int _selectedIndex = 0;
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
          title: Image.asset(
            'assets/images/logo_small.png',
            width: 32,
            height: 32,
          ),
          backgroundColor: const Color.fromARGB(255, 240, 242, 236),
          elevation: 0.0,
          scrolledUnderElevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Overall progress',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ClipRect(
                          child: Container(
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            height: 300,
                            width: MediaQuery.of(context).size.width * 0.42,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: RotationTransition(
                                turns: const AlwaysStoppedAnimation(-70 / 360),
                                child: CircularArchProgressBar(
                                  value: -40.0,
                                  fillGradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFffa384),
                                      Color(0xFFffa384),
                                      Color(0xFFa4aa9c),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          bottom: MediaQuery.of(context).size.height / 5.1,
                          child: const Text(
                            '23/31',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Column(
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'You have been following your goal for ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text: '23',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: ' days',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            softWrap: true,
                          ),
                          const SizedBox(height: 30),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '8 ',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: 'days left until reaching goal!',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: CircularPercentIndicator(
                        radius: 50,
                        lineWidth: 10.0,
                        percent: 0.75,
                        center: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("75%",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF535355))),
                          ],
                        ),
                        backgroundColor: const Color.fromRGBO(230, 227, 223, 1),
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My current track',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '23',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'GOAL',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '31',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
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
                                      Color.fromRGBO(164, 171, 155, 1),
                                      Color.fromRGBO(164, 171, 155, 1),
                                    ],
                                  ),
                                )
                              : const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                          child: Center(
                            child: Text(
                              days[i],
                              style: TextStyle(
                                color: i == 0 ? Colors.white : Colors.black38,
                                fontSize: 16,
                                fontFamily: 'Gilroy',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 88,
                  maxWidth: MediaQuery.of(context).size.width * 0.92,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
                      offset: Offset(1, 3),
                      blurRadius: 9,
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hey!',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Today is an important day, don't miss your workout, go to the nutrition plan and follow it",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0, left: 15),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: CircularPercentIndicator(
                        radius: 75,
                        lineWidth: 15.0,
                        percent: 0.75,
                        center: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("89%",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF535355))),
                          ],
                        ),
                        backgroundColor: const Color.fromRGBO(230, 227, 223, 1),
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My current goal',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '3 times (weekly)',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Your Progress',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      animation: true,
                      lineHeight: 10.0,
                      animationDuration: 2000,
                      percent: 0.63,
                      barRadius: const Radius.circular(18),
                      backgroundColor: const Color.fromRGBO(230, 227, 223, 1),
                      linearGradient: const LinearGradient(colors: <Color>[
                        Color(0xFFffa384),
                        Color(0xFFffa384),
                        Color(0xFFffa384),
                        Color(0xFFa4aa9c),
                      ]),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '80 kg',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '95 kg',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Weight Chart',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 210,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(
                    color: const Color.fromRGBO(230, 227, 223, 1),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 68,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: _selectedIndex == 0
                              ? const Color.fromRGBO(196, 203, 185, 1)
                              : Colors.transparent,
                        ),
                        child: const Text(
                          'Day',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 68,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: _selectedIndex == 1
                              ? const Color.fromRGBO(196, 203, 185, 1)
                              : Colors.transparent,
                        ),
                        child: const Text(
                          'Week',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 68,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: _selectedIndex == 2
                              ? const Color.fromRGBO(196, 203, 185, 1)
                              : Colors.transparent,
                        ),
                        child: const Text(
                          'Month',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 163, 132, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text('Actual')
                    ],
                  ),
                  const SizedBox(width: 30),
                  Row(
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(164, 171, 155, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text('Goal')
                    ],
                  ),
                ],
              ),
              Center(
                  child: Container(
                      height: 200,
                      child: SfCartesianChart(
                          primaryXAxis: const CategoryAxis(),
                          series: <CartesianSeries>[
                            LineSeries<ChartData, String>(
                                dataSource: [
                                  ChartData('feb', 80, Colors.red),
                                  ChartData('mar', 87, Colors.red),
                                  ChartData('fpr', 80, Colors.red),
                                  ChartData('may', 70, Colors.red),
                                  ChartData('jun', 75, Colors.red),
                                  ChartData('july', 70, Colors.red),
                                ],
                                // Bind the color for all the data points from the data source
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y),
                            LineSeries<ChartData, String>(
                                dataSource: [
                                  ChartData('feb', 90, Colors.green),
                                  ChartData('mar', 97, Colors.green),
                                  ChartData('fpr', 90, Colors.green),
                                  ChartData('may', 80, Colors.green),
                                  ChartData('jun', 85, Colors.green),
                                  ChartData('july', 80, Colors.green),
                                ],
                                // Bind the color for all the data points from the data source
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y),
                          ]))),
              const SizedBox(height: 40),
              const Text(
                'Impact on the result',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Negative',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Smoking',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Fastfood',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Positive',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Sleep',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Daily regime',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class CircularArchProgressBar extends StatefulWidget {
  final double value;
  final double strokeWidth;
  final Gradient fillGradient;
  final Gradient fillGradient2;
  final Color backgroundColor;

  CircularArchProgressBar({
    required this.value,
    this.strokeWidth = 35.0,
    required this.fillGradient,
    this.backgroundColor = Colors.grey,
    this.fillGradient2 = const LinearGradient(
      colors: [
        Color(0xFFa4aa9c),
        Color(0xFFa4aa9c),
      ],
    ),
  });

  @override
  _CircularArchProgressBarState createState() =>
      _CircularArchProgressBarState();
}

class _CircularArchProgressBarState extends State<CircularArchProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation =
        Tween<double>(begin: 0.0, end: widget.value).animate(_controller);

    // Додамо прослуховувач, щоб оновити анімацію при зміні значення value
    _animation.addListener(() {
      setState(() {}); // Повідомляємо про зміну для перемалювання віджету
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CircularArchProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Якщо значення змінилося, ми повинні оновити анімацію
    if (oldWidget.value != widget.value) {
      _controller.reset(); // Скидаємо анімацію
      _animation =
          Tween<double>(begin: 0.0, end: widget.value).animate(_controller);
      _controller.forward(); // Запускаємо анімацію знову
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      height: 250.0,
      child: CustomPaint(
        painter: CircularArchProgressBarPainter(
          strokeWidth: widget.strokeWidth,
          fillGradient: widget.fillGradient,

          value: _animation.value,
          fillGradient2:
              widget.fillGradient2, // Використовуємо значення анімації
        ),
      ),
    );
  }
}

class CircularArchProgressBarPainter extends CustomPainter {
  final double strokeWidth; // Радіус бордера
  final double value;
  final Gradient fillGradient;
  final Gradient fillGradient2;

  CircularArchProgressBarPainter({
    required this.strokeWidth,
    required this.value,
    required this.fillGradient,
    required this.fillGradient2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = strokeWidth // Встановлюємо радіус бордера
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    final Paint paint2 = Paint()
      ..strokeWidth = strokeWidth // Встановлюємо радіус бордера
      ..strokeCap = StrokeCap.butt
      //..color = Colors.red
      ..color = const Color.fromRGBO(230, 227, 223, 1)
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    const double startAngle = 2.8; // Починаємо з правого боку
    final double sweepAngle = 2 * math.pi * (value / 100);

    const double startAngle2 = 2.8; // Починаємо з правого боку
    const double sweepAngle2 = 2 * math.pi * (-41.5 / 83);

    // Apply gradient color
    paint.shader = fillGradient.createShader(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
    );

    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: 82),
      startAngle2,
      sweepAngle2,
      false,
      paint2,
    );

    // Малюємо прогрес-дугу
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
