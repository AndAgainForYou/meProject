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
                  CalculateGlobalWidget.of(context).userModelBuilder.name =
                      text;
                  CalculateGlobalWidget.of(context)
                      .setButtonActivity(text.isNotEmpty);
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
      ],
    );
  }
}
