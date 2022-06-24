import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String title;
  final String hintText;
  final Widget suffixIcon;
  final bool? obscureText;
  final Function(String) onChanged;

  const CustomTextField(
      {Key? key,
      this.textEditingController,
      required this.title,
      required this.hintText,
      required this.suffixIcon,
      this.obscureText = false, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: title, hintText: hintText, suffixIcon: suffixIcon,
      
      ),
      onChanged: onChanged,
    );
  }
}
