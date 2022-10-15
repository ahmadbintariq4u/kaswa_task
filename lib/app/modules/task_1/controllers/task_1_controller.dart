import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaswa_task/app/data/repository/timetable_repo.dart';

import '../../../data/repository/freerooms_repo.dart';

class Task1Controller extends GetxController {
  var freerooms = <String>[].obs;
  var teachers = <String>[].obs;
  var sections = <String>[].obs;
  var selectedTeacher = ''.obs;
  var selSection = ''.obs;

  final booked_rooms = [].obs;
  @override
  TextEditingController timeController = TextEditingController();
  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);
  String dateTime = "";

  final freeroomsRepository = FreeroomsRepository();
  final timetableRepository = TimetableRepository();

  @override
  void onInit() {
    timeController.text = DateFormat.jm().format(DateTime.now());

    freerooms.value = freeroomsRepository.getFreeRooms();
    teachers.value = timetableRepository.getTeachers();

    selectedTeacher.value = teachers[0];
    sections.value = timetableRepository.getTeacherSections(teachers[0]);
    selSection.value = sections[0];

    print(freerooms);
    super.onInit();
  }

  var freeLectures = [];
  getFreeLectures(String teacher, String section) {
    freeLectures.clear();
    freeLectures = timetableRepository.getFreeLectures(teacher, section);
    return freeLectures;
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    // if (picked != null)
    //   setState(() {
    //     selectedTime = picked;
    //     _hour = selectedTime.hour.toString();
    //     _minute = selectedTime.minute.toString();
    //     _time = _hour + ' : ' + _minute;
    //     _timeController.text = _time;
    //     _timeController.text = formatDate(
    //         DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
    //         [hh, ':', nn, " ", am]).toString();
    //   });
  }
}
