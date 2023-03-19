import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

// to make a button
class Mybutton extends StatelessWidget {
  final color;
  final textColor;
  final String textButton;
  final buttonTap ;

  const Mybutton(
      {super.key, this.color, this.textColor, required this.textButton, this.buttonTap});

Widget build(BuildContext context) {

    return GestureDetector(
      onTap: buttonTap ,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(
                color: textColor,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
