
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/utils/margin.dart';
class TextButton extends StatelessWidget {
  const TextButton(
      {Key key,
      @required this.onTap,
      this.text = 'Continue',
      this.color,
      this.width})
      : super(key: key);

  final VoidCallback onTap;
  final String text;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? screenWidth(context),
      child: CupertinoButton(
        child: Text(
          '$text',
          style: TextStyle(color: Colors.white),
        ),borderRadius: BorderRadius.circular(0),
        onPressed: this.onTap,
        color: color ?? Theme.of(context).primaryColor,
        pressedOpacity: 0.3,
      ),
    );
  }
}
