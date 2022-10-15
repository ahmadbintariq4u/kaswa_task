import 'package:get/get.dart';

import '../../../data/repository/data_repo.dart';

class Task2Controller extends GetxController {
  late final MyModelRepository repo;
  @override
  void onInit() {
    repo = MyModelRepository();
    super.onInit();
  }
}
