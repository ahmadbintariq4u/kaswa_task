import 'package:get/get.dart';

import '../controllers/task_1_controller.dart';

class Task1Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<Task1Controller>(
      Task1Controller(),
    );
  }
}
