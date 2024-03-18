import 'package:flutter/material.dart';

class CalculateRefrigeratorFoodWidget extends StatefulWidget {
  const CalculateRefrigeratorFoodWidget({super.key});

  @override
  State<CalculateRefrigeratorFoodWidget> createState() =>
      _CalculateRefrigeratorFoodWidgetState();
}

class _CalculateRefrigeratorFoodWidgetState
    extends State<CalculateRefrigeratorFoodWidget> {
  bool _isButtonActive = false;
  TextEditingController? controllerTextField;
  List<String> foodList = [];

  @override
  void initState() {
    super.initState();
    controllerTextField = TextEditingController();
  }

  @override
  void dispose() {
    controllerTextField!.dispose();
    super.dispose();
  }

  void _onSubmitted(String text) {
    setState(() {
      if (text.isNotEmpty) {
        foodList = text.split(',');
        _isButtonActive = true;
      } else {
        _isButtonActive = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 236),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: IconButton(
            icon: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 240, 242, 236),
        surfaceTintColor: Colors.transparent,
        title: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            Image(
              image: AssetImage('assets/images/logo_small.png'),
              height: 32,
              width: 32,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Write down which foods',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Gilroy', fontSize: 16),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 185,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(230, 227, 223, 1),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: controllerTextField,
                    maxLines: 15,
                    decoration: const InputDecoration(
                      hintText: 'Add a note\nSeparated by commas',
                      hintStyle: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    onSubmitted: _onSubmitted,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 54.0,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: _isButtonActive
                    ? const Color(0xFFA4AC9C)
                    : const Color(0xFFCDC9C4),
              ),
              child: ElevatedButton(
                onPressed: _isButtonActive
                    ? () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pop(foodList);
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
                  'Save',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
