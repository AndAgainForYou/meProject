import 'package:flutter/material.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateNameWidget extends StatefulWidget {
  const CalculateNameWidget({Key? key}) : super(key: key);

  @override
  _CalculateNameWidgetState createState() => _CalculateNameWidgetState();
}

class _CalculateNameWidgetState extends State<CalculateNameWidget> {
  TextEditingController _nameController = TextEditingController();
  bool _isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Обробник натискання кнопки назад
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: const Image(
          image: AssetImage('assets/images/logo_small.png'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Questions:',
                    textAlign: TextAlign.left,
                    style: whiteTheme.textTheme.titleSmall),
                const SizedBox(width: 8),
                Text('1/39',
                    textAlign: TextAlign.left,
                    style: whiteTheme.textTheme.bodySmall),
              ],
            ),
            const SizedBox(height: 100),
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
                onPressed: _isButtonActive ? () {} : null,
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
        ),
      ),
    );
  }
}
