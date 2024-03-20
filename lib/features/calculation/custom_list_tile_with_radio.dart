import 'package:flutter/material.dart';

class CustomListTileWithRadio extends StatefulWidget {
  final String title;
  final bool isChecked;
  final Function(bool) onTilePressed;
  final TextStyle? customStyle;
  final String? subtitle;

  const CustomListTileWithRadio({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onTilePressed,
    this.customStyle,
    this.subtitle,
  }) : super(key: key);

  @override
  _CustomListTileWithRadioState createState() =>
      _CustomListTileWithRadioState();
}

class _CustomListTileWithRadioState extends State<CustomListTileWithRadio> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = widget.customStyle ??
        const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 15,
          fontWeight: FontWeight.w600,
        );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
      alignment: Alignment.center,
      height: widget.subtitle != null ? 120 : 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.isChecked
            ? const Color.fromRGBO(196, 203, 185, 0.6)
            : const Color.fromRGBO(255, 255, 255, 1),
        border: widget.isChecked
            ? Border.all(
                width: 2,
                color: const Color.fromRGBO(164, 171, 155, 1),
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
          style: textStyle,
        ),
        subtitle: widget.subtitle != null && widget.subtitle!.isNotEmpty
            ? Text(widget.subtitle!)
            : null,
        leading: Image(
          width: 24,
          height: 24,
          image: widget.isChecked
              ? const AssetImage('assets/images/done-radio.png')
              : const AssetImage('assets/images/notdone-radio.png'),
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
