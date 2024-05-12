import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _countAnimation;

  final int startCount = 100;
  final int endCount = 250;
  final Duration duration = Duration(seconds: 2); // Adjust the duration as needed

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _countAnimation = IntTween(begin: startCount, end: endCount).animate(_controller)
      ..addListener(() {
        setState(() {}); // Rebuild the widget when the animation value changes
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${_countAnimation.value}",
      style: TextStyle(fontSize: 20), // Adjust the style as needed
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
