import '../providers/timetable_provider.dart';

class TimetableRepository {
  final TimetableProvider _timetableProvider = TimetableProvider();

  List<String> getTeachers() {
    return _timetableProvider.getTeachers();
  }

  getTeacherSections(String teacher) {
    return _timetableProvider.getTeacherSections(teacher);
  }

  List<String> getFreeLectures(String teacher, String section) {
    return _timetableProvider.getFreeLecture(teacher, section);
  }
}
