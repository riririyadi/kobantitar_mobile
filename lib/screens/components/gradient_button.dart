import 'package:flutter/material.dart';

/** @Change New Widget: Gradient Button */
class GradientButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final List<Color> gradientColors;
  final bool isDisabled;
  final List<BoxShadow>? boxShadow;
  const GradientButton({
    required this.text,
    required this.onTap,
    this.boxShadow,
    this.isDisabled = false,
    this.gradientColors = const [Color(0xffC04C4C), Color(0xffF37F7F)],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: isDisabled ? [Colors.grey, Colors.grey] : this.gradientColors ),
          borderRadius: BorderRadius.circular(10),
          boxShadow:  this.boxShadow != null ? boxShadow  : [
            (text == "Non Anggota")
                ? BoxShadow(
                    color: Colors.black.withOpacity(0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 0.0), // shadow direction: bottom
                  )
                : const BoxShadow(
              color: Color(0x59A93636),
              blurRadius: 7.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 4.0), // shadow direction: bottom
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
