import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFieldType {
  email,
  password,
  normal,
  phoneNumber,
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
  final List<TextInputFormatter>? inputFormatters;

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
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextFieldType? type;
  bool isHidden = false;
  bool isValid = false;
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        labelText: widget.title,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ??
            GestureDetector(
              onTap: widget.onTapSuffixIcon ?? changeSuffixIcon,
              child: suffixIconPassword(),
            ),
        border: outlineInputBorder(AppColor.hFF9F29),
        enabledBorder: outlineInputBorder(AppColor.borderOTPColor),
        focusedBorder: outlineInputBorder(Colors.blueGrey),
        errorBorder: outlineInputBorder(Colors.red.shade800)
      ),
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validatorText(value),
    );
  }

  void changeSuffixIcon() {
    setState(
      () {
        isHidden = !isHidden;
      },
    );
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

  String validatorText(String? value) {
    switch (widget.type) {
      case TextFieldType.email:
        if (value == null || value.isEmpty) {
          return Constants.required;
        } else if (!isEmailValid(value)) {
          return Constants.emailInvalid;
        }
        break;
      case TextFieldType.password:
        if (value == null || value.isEmpty) {
          return Constants.required;
        } else if (!isPasswordValid(value)) {
          return Constants.passwordInvalid;
        }
        break;
      case TextFieldType.normal:
        break;
      case TextFieldType.phoneNumber:
        if (value == null || value.isEmpty) {
          return Constants.required;
        } else if (!isPhoneValid(value)) {
          return Constants.phoneInvalid;
        }
        break;
    }
    return "";
  }

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return emailRegExp.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
    );
    return passwordRegExp.hasMatch(password);
  }

  bool isPhoneValid(String phone) {
    final RegExp phoneRegExp = RegExp(
      r'(^(?:[+0]9)?[0-9]{9,10}$)',
    );
    return phoneRegExp.hasMatch(phone);
  }

  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: .6),
      borderRadius: BorderRadius.circular(20.0),
    );
  }
}
