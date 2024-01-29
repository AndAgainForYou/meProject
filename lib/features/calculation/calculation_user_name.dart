import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateNameWidget extends StatefulWidget {
  const CalculateNameWidget({Key? key}) : super(key: key);

  @override
  _CalculateNameWidgetState createState() => _CalculateNameWidgetState();
}

class _CalculateNameWidgetState extends State<CalculateNameWidget> {
  final TextEditingController _nameController = TextEditingController();
  bool _isButtonActive = false;

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
              'Create your User Name',
              textAlign: TextAlign.center,
              style: whiteTheme.textTheme.bodyMedium,
            ),
            Center(
              child: TextField(
                controller: _nameController,
                textAlign: TextAlign.center,
                style: whiteTheme.textTheme.titleMedium
                    ?.copyWith(color: Colors.black),
                obscureText: false,
                onChanged: (text) {
                  setState(() {
                    _isButtonActive = text.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'My name is...',
                  hintStyle: whiteTheme.textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 54.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF59A7A7),
                Color(0xFFAFCD6D),
              ],
            ),
          ),
          child: ElevatedButton(
            onPressed: _isButtonActive
                ? () {
                    FocusScope.of(context).unfocus();
                    CalculateGlobalWidget.of(context).pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
