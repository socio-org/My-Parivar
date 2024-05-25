import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function onClick;
  final Color fillColor;
  final Color textColor;
  final bool border;
  final double padding;

  const MyButton({super.key, 
    required this.text,
    required this.onClick,
    required this.fillColor,
    required this.textColor,
    this.padding = 15.0,
    this.border = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: border ? 14.0 : (padding ?? 15.0),
        ),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(8.0),
          border: border
              ? Border.all(
                  color: textColor,
                  width: 1.0,
                )
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
