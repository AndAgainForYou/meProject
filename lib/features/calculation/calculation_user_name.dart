import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateNameWidget extends StatefulWidget {
  const CalculateNameWidget({Key? key}) : super(key: key);

  @override
  _CalculateNameWidgetState createState() => _CalculateNameWidgetState();
}

class _CalculateNameWidgetState extends State<CalculateNameWidget> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'What’s your name?',
              textAlign: TextAlign.center,
              style: whiteTheme.textTheme.bodyMedium,
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Container(
                width: 358.0,
                height: 52.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Color.fromRGBO(230, 227, 223, 1),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    cursorColor: Colors.orange,
                    controller: _nameController,
                    textAlign: TextAlign.start,
                    style: whiteTheme.textTheme.titleMedium
                        ?.copyWith(color: Colors.black),
                    obscureText: false,
                    onChanged: (text) {
                      CalculateGlobalWidget.of(context).userModelBuilder.name =
                          text;
                      CalculateGlobalWidget.of(context)
                          .setButtonActivity(text.isNotEmpty);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'My name is...',
                      hintStyle: whiteTheme.textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
