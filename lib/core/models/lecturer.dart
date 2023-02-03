import 'package:dule/core/models/scheduled_course.dart';

import 'course.dart';

class Lecturer {
  final String name;
  final List<Course> coursesTaught;
  static final List<ScheduledCourse> _scheduledCourses = [];
  const Lecturer({
    required this.name,
    required this.coursesTaught,
  }) : assert(coursesTaught.length != 0);

  void scheduleACourse(ScheduledCourse course) {
    _scheduledCourses.add(course);
  }
}
