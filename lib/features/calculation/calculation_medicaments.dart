import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateMedicamentsWidget extends StatefulWidget {
  const CalculateMedicamentsWidget({Key? key}) : super(key: key);

  @override
  _CalculateMedicamentsWidgetState createState() =>
      _CalculateMedicamentsWidgetState();
}

class _CalculateMedicamentsWidgetState
    extends State<CalculateMedicamentsWidget> {
  TextEditingController? controllerTextField;
  List<String> medicamentsArray = [];
  @override
  void initState() {
    super.initState();
    controllerTextField = TextEditingController();
    controllerTextField!.addListener(_onTextFieldChanged);
  }

  @override
  void dispose() {
    controllerTextField!.dispose();
    super.dispose();
  }

  void _onTextFieldChanged() {
    setState(() {
      if (controllerTextField!.text.isNotEmpty) {
        medicamentsArray = controllerTextField!.text.split(',');
        CalculateGlobalWidget.of(context).userModelBuilder.medicaments =
            medicamentsArray;
        CalculateGlobalWidget.of(context).setButtonActivity(true);
      } else {
        CalculateGlobalWidget.of(context).setButtonActivity(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Medicaments',
          textAlign: TextAlign.center,
          style: whiteTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 30),
        Container(
          height: 185,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: Color.fromRGBO(230, 227, 223, 1),
              )),
          child: TextField(
            controller: controllerTextField,
            maxLines: 15,
            decoration: InputDecoration(
              hintText:
                  'Please write the name of the medicine\nSeparated by commas',
              hintStyle: const TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
