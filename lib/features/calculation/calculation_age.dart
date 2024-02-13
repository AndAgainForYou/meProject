import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateAgeWidget extends StatefulWidget {
  const CalculateAgeWidget({Key? key}) : super(key: key);

  @override
  _CalculateAgeWidgetState createState() => _CalculateAgeWidgetState();
}

class _CalculateAgeWidgetState extends State<CalculateAgeWidget> {
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  bool _isButtonActive = false;
  String _errorText = "";

  int findAge(int day, int month, int year) {
    final now = DateTime.now();
    final dateBirthday = DateTime.utc(year, month, day);
    final difference = now.difference(dateBirthday);
    const daysInYear = 365.25;
    if (now.day == dateBirthday.day && now.month == dateBirthday.month) {
      final ageInYears = (difference.inDays / daysInYear).round();
      return ageInYears.toInt();
    } else {
      final ageInYears = difference.inDays / daysInYear;
      return ageInYears.toInt();
    }
  }

  @override
  void initState() {
    super.initState();
    _dayController.addListener(_updateAgeText);
    _monthController.addListener(_updateAgeText);
    _yearController.addListener(_updateAgeText);
  }

  void _updateAgeText() {
    setState(() {
      _validateInput();
    });
  }

  void _validateInput() {
    final String day = _dayController.text;
    final String month = _monthController.text;
    final String year = _yearController.text;

    _errorText = "";

    if (day.isNotEmpty &&
        month.isNotEmpty &&
        year.isNotEmpty &&
        year.length == 4) {
      try {
        final int dayValue = int.parse(day);
        final int monthValue = int.parse(month);
        final int yearValue = int.parse(year);

        if (dayValue < 1 || dayValue > 31) {
          _errorText = "Invalid day";
        } else if (monthValue < 1 || monthValue > 12) {
          _errorText = "Invalid month";
        } else if (yearValue < 1) {
          _errorText = "Invalid year";
        } else {
          _isButtonActive = true;
          CalculateGlobalWidget.of(context).userModelBuilder.birthday_date =
              "$yearValue-$monthValue-$dayValue";
          CalculateGlobalWidget.of(context).setButtonActivity(true);
        }
      } catch (e) {
        _errorText = "Invalid input";
        _isButtonActive = false;
        CalculateGlobalWidget.of(context).setButtonActivity(false);
      }
    } else {
      _isButtonActive = false;
      CalculateGlobalWidget.of(context).setButtonActivity(false);
    }
  }

  @override
  void dispose() {
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How old are you?',
              textAlign: TextAlign.center,
              style: whiteTheme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Text(
              _calculateAgeText(),
              textAlign: TextAlign.center,
              style: whiteTheme.textTheme.titleMedium!.copyWith(
                color: _errorText.isNotEmpty ? Colors.red : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Text(
                  'Age',
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(35, 35, 35, 0.2),
                    offset: Offset(0, 3),
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color: Colors.white,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: buildInputField(
                      controller: _dayController,
                      label: 'Day',
                      length: 2,
                      errorText:
                          _errorText.contains('day') ? 'Invalid day' : null,
                    ),
                  ),
                  Expanded(
                    child: buildInputField(
                      controller: _monthController,
                      label: 'Month',
                      length: 2,
                      errorText:
                          _errorText.contains('month') ? 'Invalid month' : null,
                    ),
                  ),
                  Expanded(
                    child: buildInputField(
                      controller: _yearController,
                      label: 'Year',
                      length: 4,
                      errorText:
                          _errorText.contains('year') ? 'Invalid year' : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }

  String _calculateAgeText() {
    return _errorText.isNotEmpty
        ? _errorText
        : _isButtonActive
            ? _getAgeText()
            : '...';
  }

  String _getAgeText() {
    final String day = _dayController.text;
    final String month = _monthController.text;
    final String year = _yearController.text;

    final int age = findAge(int.parse(day), int.parse(month), int.parse(year));
    return age.toString();
  }

  Widget buildInputField({
    required TextEditingController controller,
    required String label,
    required int length,
    String? errorText,
  }) {
    return Container(
      padding: const EdgeInsets.only(right: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 8),
              alignment: Alignment.centerRight,
              child: Text(
                label,
                style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 8,
                left: 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                maxLength: length,
                controller: controller,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: errorText != null ? Colors.red : Colors.black,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
