import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color? bgColor;
  final double? width;
  final double? height;
  const CustomButton(
      {Key? key,
      this.onPressed,
      required this.text,
      this.bgColor,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: width ?? size.width,
        height: height ?? 56,
        color: bgColor ?? Colors.amber,
        child: Text(text.toUpperCase()),
      ),
    );
  }
}
