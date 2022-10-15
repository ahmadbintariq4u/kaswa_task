import 'package:get/get.dart';

import '../controllers/task_2_controller.dart';

class Task2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Task2Controller>(
      () => Task2Controller(),
    );
  }
}
