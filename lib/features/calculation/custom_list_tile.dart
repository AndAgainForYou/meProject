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
      alignment: Alignment.center,
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.isChecked
            ? const Color.fromRGBO(196, 203, 185, 0.6)
            : const Color.fromRGBO(255, 255, 255, 1),
        border: widget.isChecked
            ? Border.all(
                width: 2,
                color: Color.fromRGBO(164, 171, 155, 1),
              )
            : Border.all(
                width: 2,
                color: Colors.transparent,
              ),
      ),
      child: ListTile(
        splashColor: Colors.transparent,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Image(
          width: 24,
          height: 24,
          image: widget.isChecked
              ? const AssetImage('assets/images/ico-done.png')
              : const AssetImage('assets/images/ico-unselected.png'),
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
