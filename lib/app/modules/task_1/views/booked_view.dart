import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaswa_task/app/modules/task_1/controllers/task_1_controller.dart';
import 'package:kaswa_task/app/themes/constants.dart';
import 'package:kaswa_task/app/widgets/global_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class BookedRooms extends GetView<Task1Controller> {
  const BookedRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Rooms'),
        centerTitle: true,
      ),
      body: controller.bookedRooms.isEmpty
          ? const Text("No Booked Scheduled").text.bold.makeCentered()
          : ListView.builder(
              itemCount: controller.bookedRooms.length,
              itemBuilder: (BuildContext context, int index) {
                final tokens =
                    controller.bookedRooms[index].slot.toString().split('-');
                return Card(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(tokens[0]),
                          const Text("|"),
                          Text(tokens[1]),
                        ],
                      ).p(kPadding),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.bookedRooms[index].teacherID!)
                                .text
                                .bold
                                .make(),
                            kHeight,
                            Text("${controller.bookedRooms[index].date} : ${controller.bookedRooms[index].day}")
                                .text
                                .bold
                                .make(),
                            kHeight,
                            Text("${controller.bookedRooms[index].room}")
                                .text
                                .bold
                                .make(),
                          ]).p(kPadding),
                    ],
                  ),
                );
              },
            ).p(kPadding),
    );
  }
}
