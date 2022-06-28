import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/custom_text_field.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:flutter/material.dart';

import '../../resource/app_string.dart';
import '../../router/navigation_service.dart';

class InputInformationScreen extends StatefulWidget {
  const InputInformationScreen({Key? key}) : super(key: key);

  @override
  State<InputInformationScreen> createState() => _InputInformationScreenState();
}

class _InputInformationScreenState extends State<InputInformationScreen> {
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  late TextEditingController descController;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    descController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Input Information"),
        ),
        body: Form(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Input Information".toUpperCase(),
                    style: AppStyle.header,
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    textEditingController: usernameController,
                    title: AppString.username,
                    hintText: AppString.usernameInput,
                  ),
                  CustomTextField(
                    textEditingController: phoneController,
                    title: AppString.phone,
                    hintText: AppString.phoneInput,
                  ),
                  CustomTextField(
                    textEditingController: descController,
                    title: AppString.desc,
                    hintText: AppString.descInput,
                  ),
                  const SizedBox(height: 20.0),
                  CustomButton(
                      text: "Submit",
                      onPressed: () {
                        
                        NavigationService.navigatorKey.currentState
                            ?.pushNamed('/show_information');
                      })
                ]),
          ),
        ));
  }
}
