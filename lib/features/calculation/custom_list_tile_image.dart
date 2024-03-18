import 'package:flutter/material.dart';

class CustomListTileWithImage extends StatefulWidget {
  final String title;
  final bool isChecked;
  final Function(bool) onTilePressed;
  final TextStyle? customStyle;
  final String? subtitle;
  final String? imageName;

  const CustomListTileWithImage({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onTilePressed,
    this.customStyle,
    this.subtitle,
    this.imageName,
  }) : super(key: key);

  @override
  _CustomListTileWithImageState createState() =>
      _CustomListTileWithImageState();
}

class _CustomListTileWithImageState extends State<CustomListTileWithImage> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = widget.customStyle ??
        const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 17,
          fontWeight: FontWeight.w600,
        );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      padding: EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(255, 255, 255, 1),
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
        title: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 0,
              child: Image(
                width: 140,
                height: 150,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${widget.imageName}.png'),
              ),
            ),
            Positioned(
              left: 0,
              top: 50,
              child: Text(
                widget.title,
                style: textStyle,
              ),
            ),
          ],
        ),
        subtitle: widget.subtitle != null && widget.subtitle!.isNotEmpty
            ? Text(widget.subtitle!)
            : null,
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
