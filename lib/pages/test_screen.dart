import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: Constants.email,
                hintText: Constants.emailInput,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExampleMask {
  final TextEditingController? textEditingController;
  final MaskTextInputFormatter? formatter;
  final FormFieldValidator<String>? validator;
  final String? hint;
  final TextInputType? textInputType;
  const ExampleMask({
    this.textEditingController,
    this.formatter,
    this.validator,
    this.hint,
    this.textInputType,
  });
}

class CustomExampleTextField extends StatelessWidget {
  CustomExampleTextField({Key? key}) : super(key: key);
  final List<ExampleMask> examples = [
    ExampleMask(
      formatter: MaskTextInputFormatter(mask: "+# (###) ###-##-##"),
      hint: "+1 (234) 567-89-01",
      textInputType: TextInputType.phone,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: examples.map(buildTextField).toList(),
    );
  }

  Widget buildTextField(ExampleMask exampleMask) {
    return TextFormField(
      controller: exampleMask.textEditingController,
      decoration: InputDecoration(hintText: exampleMask.hint),
      inputFormatters: [LowerCaseTextFormatter()],
    );
  }
}

class LowerCaseTextFormatter implements TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toLowerCase(), selection: newValue.selection);
  }
}
