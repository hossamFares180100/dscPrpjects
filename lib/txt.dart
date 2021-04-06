import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  final String title;
  final double fontsize;
  final FontWeight weight;
  final Color color;
  const Txt(this.title, this.fontsize, this.weight, this.color);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: weight,
          decoration: title.startsWith('I')
              ? TextDecoration.underline
              : TextDecoration.none),
    );
  }
}
