import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kaswa_task/app/themes/constants.dart';
import 'package:kaswa_task/app/widgets/global_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../routes/app_pages.dart';
import '../controllers/task_1_controller.dart';
import 'booked_view.dart';

class Task1View extends GetView<Task1Controller> {
  const Task1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Compare'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCard().cornerRadius(kRaidus).p(kPadding),
            ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.BOOKING, arguments: {
                        "teacher": controller.selectedTeacher.value,
                        'section': controller.selSection.value
                      });
                      // Get.toNamed(Routes.BOOKING);
                    },
                    child: const Text("Find Now").p(kPadding))
                .cornerRadius(kRaidus)
                .pSymmetric(h: kPadding + 4),
            kHeight,
            ElevatedButton(
                    onPressed: () {
                      // Get.toNamed(Routes.BOOKING);
                      Get.to(() => const BookedRooms());
                    },
                    child: const Text("See Booked Rooms").p(kPadding))
                .cornerRadius(kRaidus)
                .pSymmetric(h: kPadding + 4),
            const Spacer(),
            const Text(
                    "All the data is for now dummy, with the help of provider we can get the data from the server")
                .text
                .red900
                .bold
                .make()
                .p(kPadding),
          ],
        ));
  }

  Card _buildCard() {
    return Card(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            kHeight,
            const Text(
              "Teachers",
              textAlign: TextAlign.start,
            ).text.bold.make(),
            Obx(() => DropdownButton<String>(
                  // isDense: true,
                  // Initial Value
                  isExpanded: true,
                  value: controller.selectedTeacher.value,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: controller.teachers.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selecte)
                  //d value
                  onChanged: (String? newValue) {
                    controller.selectedTeacher.value = newValue!;

                    controller.sections.value = controller.timetableRepository
                        .getTeacherSections(newValue);

                    controller.selSection.value = controller.sections[0];
                  },
                )),
            const Text("Sections").text.bold.make(),
            Obx(() => DropdownButton<String>(
                  // Initial Value
                  isExpanded: true,

                  value: controller.selSection.value,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: controller.sections.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selecte)
                  //d value
                  onChanged: (String? newValue) {
                    controller.selSection.value = newValue!;
                  },
                )),
            kHeight,
          ]).p(kPadding),
    );
  }
}
