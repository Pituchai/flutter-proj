import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: 420,
          decoration: const BoxDecoration(
              color: Color(0xff368983),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),



              ), ),
              
        )
      ],
    ));
  }
}
