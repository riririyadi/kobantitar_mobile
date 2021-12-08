import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const InfoWidget(
      {Key? key,
      required this.icon,
      required this.text,
      this.color = Colors.black38})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 80.0,
              color: color,
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w600, color: color),
              ),
            )
          ],
        ),
      ),
    );
  }
}
