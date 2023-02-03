import 'package:dule/core/models/course.dart';
import 'package:dule/core/models/lecturer.dart';

class ScheduledCourse {
  final Lecturer scheduledBy;
  final Course course;
  final DateTime from;
  final DateTime to;
  final String venue;

  ScheduledCourse({
    required this.scheduledBy,
    required this.course,
    required this.from,
    required this.to,
    required this.venue,
  }) : assert(to.difference(from) >= const Duration(hours: 1) &&
            to.difference(from) <= const Duration(hours: 2));

  get duration => to.difference(from);
}
