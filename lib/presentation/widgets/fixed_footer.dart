import 'package:animate_app/presentation/widgets/icons_content.dart';
import 'package:flutter/material.dart';

class FixedFooterScreen extends StatelessWidget {
  const FixedFooterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 40,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: const Color.fromARGB(219, 10, 9, 9),
              borderRadius: BorderRadius.circular(50)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconContent(
                color: Color.fromARGB(255, 59, 58, 58),
                icon: Icon(
                  Icons.comment,
                  color: Colors.white,
                  size: 30,
                ),
                iconheight: 1,
              ),
              IconContent(
                color: Color.fromARGB(255, 59, 58, 58),
                icon: Icon(
                  Icons.comment_bank,
                  color: Colors.white,
                  size: 30,
                ),
                iconheight: 1,
              ),
              IconContent(
                color: Colors.orange,
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
                iconheight: 1,
              ),
              IconContent(
                color: Color.fromARGB(255, 59, 58, 58),
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 30,
                ),
                iconheight: 1,
              ),
              IconContent(
                color: Color.fromARGB(255, 59, 58, 58),
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 30,
                ),
                iconheight: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
