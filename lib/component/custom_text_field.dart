import 'package:flutter/material.dart';

enum TextFieldType {
  email,
  password,
  normal,
}

class CustomTextField extends StatefulWidget {
  final String? title;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function()? onTapSuffixIcon;
  final TextFieldType type;
  final TextInputType? keyboardType;
  final String? errorText;

  const CustomTextField({
    Key? key,
    this.title,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.type = TextFieldType.normal,
    this.onTapSuffixIcon,
    this.prefixIcon,
    this.keyboardType, this.errorText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextFieldType? type;
  bool isHidden = false;
  @override
  void initState() {
    super.initState();
    type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: isHidden,
      decoration: InputDecoration(
        errorText: widget.errorText,
        labelText: widget.title,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ??
            GestureDetector(
                onTap: widget.onTapSuffixIcon ?? changeSuffixIcon,
                child: suffixIconPassword()),
      ),
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  void changeSuffixIcon() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  Widget suffixIconPassword() {
    if (type == TextFieldType.password) {
      if (isHidden) {
        return const Icon(Icons.visibility_off_rounded);
      } else {
        return const Icon(Icons.remove_red_eye);
      }
    }
    return Container();
  }
}
