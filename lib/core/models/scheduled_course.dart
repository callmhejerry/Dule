import 'package:dule/core/models/course.dart';

class ScheduledCourse {
  final String scheduledBy;
  final Course course;
  final DateTime from;
  final DateTime to;

  ScheduledCourse({
    required this.scheduledBy,
    required this.course,
    required this.from,
    required this.to,
  }) : assert(to.difference(from) >= const Duration(hours: 1) &&
            to.difference(from) <= const Duration(hours: 2));

  get duration => to.difference(from);
}
