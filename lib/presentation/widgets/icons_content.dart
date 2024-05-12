import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final Color color;
  final Icon icon;
  final double iconheight;
  const IconContent(
      {super.key,
      required this.color,
      required this.icon,
      required this.iconheight});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(30)),
          child: icon),
    );
  }
}
