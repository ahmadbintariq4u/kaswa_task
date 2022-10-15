import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaswa_task/app/data/repository/timetable_repo.dart';
import 'package:kaswa_task/app/modules/task_1/booking/models/booking_model.dart';
import 'package:kaswa_task/app/themes/constants.dart';
import 'package:kaswa_task/app/widgets/global_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controllers/task_1_controller.dart';

class BookingController extends GetxController {
  final arguments = Get.arguments;
  final repository = TimetableRepository();

  var freeLectures = <String>[].obs;
  // var freeRooms = <String>[].obs;
  var selectedRooms = "".obs;
  @override
  void onInit() {
    dateController.text = DateFormat.yMMMd().format(DateTime.now());

    freeLectures.value =
        repository.getFreeLectures(arguments['teacher'], arguments['section']);
    // freeRooms.value = Get.find<Task1Controller>().freerooms;
    // selectedRooms.value = freeRooms[0];
    selectedRooms.value = Get.find<Task1Controller>().freerooms[0];
    super.onInit();
  }

  openBottomSheet() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        height: Get.height * 0.52,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.,
          children: [
            Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Room Booking",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                    ),
                  ).paddingOnly(top: 2),
                )
              ],
            ),
            kHeight,
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  text(text: "Date"),
                  InkWell(
                    onTap: () {
                      selectDate(Get.context!);
                    },
                    child: TextField(
                      controller: dateController,
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // hintText: ,
                        suffixIcon: const Icon(
                          Icons.calendar_month_outlined,
                          // textDirection: TextDirection.rtl,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  kHeight,
                  text(text: "Time Slot"),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "11:20AM - 12:45PM",
                    ),
                  ),
                  kHeight,
                  text(text: "Room"),
                  Get.find<Task1Controller>().freerooms.isEmpty
                      ? const Text("No room available")
                          .text
                          .bold
                          .make()
                          .pSymmetric(h: kPadding / 2)
                      : Obx(() => DropdownButton(
                            isExpanded: true,
                            value: selectedRooms.value,
                            // onChanged: (String? value) {},
                            onChanged: (value) {
                              selectedRooms.value = value.toString();
                            },

                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: Get.find<Task1Controller>()
                                .freerooms
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ).pSymmetric(h: kPadding / 2)),
                ]).paddingSymmetric(horizontal: kPadding / 2),
            kHeight,
            ElevatedButton(
              onPressed: () {
                if (Get.find<Task1Controller>().freerooms.isNotEmpty) {
                  final booking = BookingModel();
                  booking.date = dateController.text;
                  booking.room = selectedRooms.value;
                  booking.slot = "11:20AM - 12:45PM";
                  booking.teacherID = arguments['teacher'];
                  booking.day = DateFormat.EEEE().format(selectedDate);

                  Get.find<Task1Controller>().booked_rooms.add(booking);
                  Get.find<Task1Controller>()
                      .freerooms
                      .remove(selectedRooms.value);

                  selectedRooms.value = Get.find<Task1Controller>().freerooms[
                      Random().nextInt(
                          Get.find<Task1Controller>().freerooms.length)];
                  Get.back();
                  Get.showSnackbar(const GetSnackBar(
                    title: "Booking Successful",
                    message: "Your booking has been confirmed",
                    backgroundColor: Colors.green,
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    duration: Duration(seconds: 2),
                  ));
                } else {
                  Get.showSnackbar(const GetSnackBar(
                    title: "Booking Unsuccessful",
                    message: "No Freerooms available",
                    backgroundColor: Colors.red,
                    icon: Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
              child: const Text(
                "Confirm Booking",
                style: TextStyle(
                  fontSize: 14,
                ),
              ).p(kPadding / 2),
            ).cornerRadius(kRaidus)
          ],
        ),
      ),
    );
  }

  Widget text({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade500,
      ),
    ).p(kPadding / 2);
  }

  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 1)));
    if (picked != null) {
      selectedDate = picked;
      dateController.text = DateFormat.yMd().format(selectedDate);
    }
  }
}
