import 'package:flutter/material.dart';

class MultiListTile extends StatefulWidget {
  final String title;
  final bool isChecked;
  final Function(bool) onTilePressed;
  final TextStyle? customStyle;
  final String? subTitle;
  final bool? buttonActive;
  final void Function()? onPressed;

  const MultiListTile({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onTilePressed,
    this.customStyle,
    this.subTitle,
    this.buttonActive,
    this.onPressed,
  }) : super(key: key);

  @override
  _MultiListTileState createState() => _MultiListTileState();
}

class _MultiListTileState extends State<MultiListTile> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = widget.customStyle ??
        const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 17,
          fontWeight: FontWeight.w600,
        );
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
      padding: (widget.buttonActive == true)
          ? EdgeInsets.only(bottom: 0)
          : EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      height: 110,
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: textStyle,
            ),
            if (widget.subTitle != null)
              Text(
                widget.subTitle!,
                maxLines: 1,
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
            if (widget.buttonActive == true)
              TextButton(
                onPressed: widget.onPressed,
                style: TextButton.styleFrom(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(bottom: 10),
                  minimumSize: Size(50, 20),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                ),
                child: const Text(
                  'Edit',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    color: Color.fromRGBO(255, 163, 132, 1),
                  ),
                ),
              ),
          ],
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
