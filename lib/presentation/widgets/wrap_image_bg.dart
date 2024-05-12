import 'package:flutter/material.dart';

class WrapImageBackgroud extends StatelessWidget {
  final double width;
  final String image;
  final int index;
  const WrapImageBackgroud(
      {super.key,
      required this.width,
      required this.image,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == 1
          ? const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0, bottom: 5.0)
          : const EdgeInsets.only(
              top: 5.0, left: 8.0, right: 8.0, bottom: 10.0),
      child: Container(
          width: width,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(32, 232, 236, 234),
                    borderRadius: BorderRadius.circular(20)

                  ),
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    color: Colors.white,
                    alignment: Alignment.bottomRight),

              
                   
                ),
              )


          ]),),
    );
  }
}
