import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kaswa_task/app/modules/task_1/booking/controllers/booking_controller.dart';
import 'package:kaswa_task/app/themes/colors.dart';
import 'package:kaswa_task/app/themes/constants.dart';
import 'package:kaswa_task/app/widgets/global_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BookingView'),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.freeLectures.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                        child: Row(children: [
                  Column(
                    children: [
                      const Text("3:00 PM").text.bold.make(),
                      const Text("|").text.bold.make(),
                      const Text("4:30 PM").text.bold.make(),
                    ],
                  ),
                  kWidth,
                  kWidth,
                  Container(
                    color: primaryColor,
                    width: 3,
                    height: 60,
                  ),
                  kWidth,
                  kWidth,
                  kWidth,
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.freeLectures[index]).text.bold.make(),
                        kHeight,
                        ElevatedButton(
                            onPressed: () {
                              controller.openBottomSheet();
                            },
                            child: const Text("Book Now"))
                      ])
                ]).p(kPadding))
                    .cornerRadius(kPadding);
              },
            ),
          ),
        ]).p(kPadding));
  }
}
