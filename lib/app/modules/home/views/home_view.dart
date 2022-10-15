import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kaswa_task/app/themes/constants.dart';
import 'package:kaswa_task/app/widgets/global_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('KASWA TASK'),
          centerTitle: true,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.TASK_1);
                    // final repo = FreeroomsRepository();
                    // print(repo.getFreeRooms());
                  },
                  child: const Text("Task 1").p(kPadding)),
              kHeight,
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.TASK_2);
                  },
                  child: const Text("Task 2").p(kPadding)),
            ]).p(kPadding));
  }
}
