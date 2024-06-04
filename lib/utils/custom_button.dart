import 'package:flutter/material.dart';
import 'package:portfolio_management/app_constant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final Color textColor;
  Color? backgroundColor;
  final FontWeight fontWeight;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = kRedColor2,
    this.textColor = kWhiteColor,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      width: 200,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(backgroundColor)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
