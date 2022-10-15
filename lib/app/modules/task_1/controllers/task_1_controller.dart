import 'package:get/get.dart';
import 'package:kaswa_task/app/data/repository/timetable_repo.dart';
import 'package:kaswa_task/app/modules/task_1/booking/models/booking_model.dart';

import '../../../data/repository/freerooms_repo.dart';

class Task1Controller extends GetxController {
  var freerooms = <String>[].obs;
  var teachers = <String>[].obs;
  var sections = <String>[].obs;
  var selectedTeacher = ''.obs;
  var selSection = ''.obs;

  final bookedRooms = <BookingModel>[].obs;
  final freeroomsRepository = FreeroomsRepository();
  final timetableRepository = TimetableRepository();

  @override
  Future<void> onInit() async {
    freerooms.value = await freeroomsRepository.getFreeRooms();
    teachers.value = timetableRepository.getTeachers();

    selectedTeacher.value = teachers[0];
    sections.value = timetableRepository.getTeacherSections(teachers[0]);
    selSection.value = sections[0];

    // print(freerooms);
    super.onInit();
  }

  var freeLectures = [];
  getFreeLectures(String teacher, String section) {
    freeLectures.clear();
    freeLectures = timetableRepository.getFreeLectures(teacher, section);
    return freeLectures;
  }
}
