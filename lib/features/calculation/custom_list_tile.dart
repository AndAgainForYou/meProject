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
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(35, 35, 35, 0.2),
            offset: Offset(0, 3),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Colors.white,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 16,
            fontWeight: FontWeight.w500,
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
