import 'package:flutter/material.dart';

class ShowInformationScreen extends StatelessWidget {
  const ShowInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Show information"),
        ),
        body: const Text("Helllo"));
  }

  Widget buildShowInformation({String? label, String? content}) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: Text(label ?? "")),
            Expanded(flex: 1, child: Text(content ?? ""))
          ],
        ),
      );
}
