import 'package:bloc_demo/get/demo/demo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoGetxScreen extends StatelessWidget {
  const DemoGetxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo GetX Screen"),
      ),
      body: GetBuilder<DemoController>(
          init: DemoController(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(child: Text('${controller.count}')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: 'getx_btn1',
                      child: const Icon(Icons.add),
                      onPressed: () => controller.increment(),
                    ),
                    const SizedBox(height: 4),
                    FloatingActionButton(
                      heroTag: 'getx_btn2',
                      child: const Icon(Icons.remove),
                      onPressed: () => controller.decrement(),
                    ),
                  ],
                ),
                // CustomButton(text: "Pass value in GetX", onPressed: () => NavigationService.navigatorKey.currentState?.pushNamed('/demo_cubit'),)
              ],
            );
          }),
    );
  }
}
