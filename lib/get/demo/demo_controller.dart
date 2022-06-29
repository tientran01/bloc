import 'package:get/get_state_manager/get_state_manager.dart';

class DemoController extends GetxController {
  var count = 0.abs();
  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }
}
