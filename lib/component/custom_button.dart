import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? bgColor;
  final double? width;
  final double? height;
  const CustomButton(
      {Key? key,
      this.onTap,
      required this.text,
      this.bgColor,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? size.width,
        height: height ?? 56,
        color: bgColor ?? Colors.amber,
        child: Text(
          text.toUpperCase(),
          style: AppStyle.title.copyWith(
            color: AppColor.hFFFFFF,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
