import 'package:flutter/material.dart';

 /** @Change New Widget: Gradient Button */
class GradientButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final List<Color> gradientColors;
  const GradientButton({
    required this.text,
    required this.onTap,
    this.gradientColors = const [Color(0xff851212), Color(0xffFF8A8A)],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: this.gradientColors),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
             BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(
                  0.0, 4.0), // shadow direction: bottom
            )
          ],
        ),
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}