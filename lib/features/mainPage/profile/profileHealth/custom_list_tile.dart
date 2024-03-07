import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final bool isChecked;
  final Function(bool) onTilePressed;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onTilePressed,
  }) : super(key: key);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(255, 255, 255, 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09000000357627869),
            offset: Offset(1, 3),
            blurRadius: 9,
          ),
        ],
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        trailing: Image(
          width: 24,
          height: 24,
          image: widget.isChecked
              ? const AssetImage('assets/images/check_icon.png')
              : const AssetImage('assets/images/circle_icon.png'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onTap: () {
          widget.onTilePressed(!widget.isChecked);
        },
      ),
    );
  }
}
