class TimetableProvider {
  final map = {
    "CS Dr. Muhammad Shoaib": {
      "sections": {
        "FA19-BSE-7-A": [
          'Engineering Geology',
          'Civil Engineering Materials',
          'Mechanics of Solids II'
        ],
        "FA19-BSE-7-B": [
          'Water Supply Engineering',
          'Steel Structures',
        ],
      },
    },
    "CS Dr. Muhammad Azhar": {
      "sections": {
        "FA19-BCS-7-A": [
          'Final Year Project (Part II)',
          'Differential Equations'
        ],
        "FA19-BCS-7-B": [
          "Probability Methods in Engineering",
          " Electronics II"
        ],
      },
    },
    "CS MS Ahmad Shaf": {
      "sections": {
        "FA19-BME-7-A": [],
        "FA19-BME-7-B": [],
      },
    },
  };

  List<String> getTeachers() {
    return map.keys.toList();
  }

  getTeacherSections(String teacher) {
    return List<String>.from(map[teacher]!['sections']!.keys);
  }

  List<String> getFreeLecture(String teacher, String section) {
    List<dynamic> lectures = map[teacher]!['sections']![section]!;
    return List<String>.from(lectures);
  }
}
