import 'package:dule/constants/screen_constants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final _focusedDay = DateTime.now();
  final _firstDay = DateTime(2020);
  final _lastDay = DateTime(2030);
  final _calendarFormat = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ScreenConstants.horizontalScreenPadding,
          vertical: ScreenConstants.verticalScreenPadding,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const ScheduleHeader(),
              const SizedBox(
                height: ScreenConstants.verticalSpacing,
              ),
              TableCalendar(
                focusedDay: _focusedDay,
                firstDay: _firstDay,
                lastDay: _lastDay,
                calendarFormat: _calendarFormat,
                headerVisible: false,
                calendarStyle: const CalendarStyle(),
                currentDay: DateTime.now(),
                startingDayOfWeek: StartingDayOfWeek.monday,
                rowHeight: 50,
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: Color.fromARGB(255, 92, 92, 92),
                    fontSize: 14,
                  ),
                  weekendStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                weekendDays: const [
                  DateTime.saturday,
                  DateTime.sunday,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleHeader extends StatelessWidget {
  const ScheduleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final todaysDate = DateTime.now();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.calendar_today,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          todaysDate.toDays(),
          style: const TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          todaysDate.year.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        const Text(
          "Today",
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

extension ToDays on DateTime {
  String toDays() {
    String day;
    switch (month) {
      case 1:
        day = "Jan";
        break;
      case 2:
        day = "Feb";
        break;
      case 3:
        day = "Mar";
        break;
      case 4:
        day = "Apr";
        break;
      case 5:
        day = "May";
        break;
      case 6:
        day = "Jun";
        break;
      case 7:
        day = "Jul";
        break;
      case 8:
        day = "Aug";
        break;
      case 9:
        day = "Sep";
        break;
      case 10:
        day = "Oct";
        break;
      case 11:
        day = "Nov";
        break;
      case 12:
        day = "Dec";
        break;
      default:
        day = "";
    }
    return day;
  }
}
