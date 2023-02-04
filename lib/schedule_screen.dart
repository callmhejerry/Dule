import 'package:dule/constants/screen_constants.dart';
import 'package:dule/utils/dateUtils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, day) {
                    if (day.weekday == DateTime.now().weekday) {
                      return Center(
                        child: Text(
                          DateFormat.E().format(day),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 134, 47),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                  outsideBuilder: (context, day, focusedDay) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day.day.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 3,
                        )
                      ],
                    );
                  },
                  disabledBuilder: (context, day, focusedDay) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day.day.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 3,
                        )
                      ],
                    );
                  },
                  defaultBuilder: (context, day, focusedDay) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day.day.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 3,
                        )
                      ],
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat.d().format(day),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 134, 47),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          color: const Color.fromARGB(255, 44, 134, 47),
                          height: 3,
                        )
                      ],
                    );
                  },
                ),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  tablePadding: EdgeInsets.all(0),
                ),
                currentDay: DateTime.now(),
                startingDayOfWeek: StartingDayOfWeek.monday,
                rowHeight: 50,
                onDaySelected: (selectedDay, focusedDay) {},
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
              Expanded(
                child: ListView(
                  children: const [
                    SizedBox(
                      height: 12,
                    ),
                    ScheduledCourseWidget(),
                    ScheduledCourseWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduledCourseWidget extends StatelessWidget {
  const ScheduledCourseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScheduledTime(
              dateTimeRange: DateTimeRange(
                start: DateTime(2022, 2, 3, 9),
                end: DateTime(2022, 2, 3, 10),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                const InActiveIndicator(),
                const SizedBox(
                  height: 4,
                ),
                Expanded(
                  child: IntrinsicWidth(
                    child: Container(
                      width: 2,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        " Mat202 Linear Algebra",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.place,
                            color: Color.fromARGB(255, 228, 227, 227),
                            size: 18,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "New faculty building , science vilage",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 228, 227, 227),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 9.5,
                            backgroundImage: AssetImage(
                              "assets/images/lecturer.jpg",
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Prof. Anigbogu",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 228, 227, 227),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InActiveIndicator extends StatelessWidget {
  const InActiveIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.deepPurpleAccent,
          width: 2.5,
        ),
      ),
    );
  }
}

class ActiveIndicator extends StatelessWidget {
  const ActiveIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      width: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.deepPurpleAccent,
          width: 2,
        ),
      ),
      child: Center(
        child: Container(
          height: 7,
          width: 7,
          decoration: const BoxDecoration(
            color: Colors.deepPurpleAccent,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class ScheduledTime extends StatelessWidget {
  final DateTimeRange dateTimeRange;
  const ScheduledTime({
    super.key,
    required this.dateTimeRange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat.jm().format(dateTimeRange.start),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          DateFormat.jm().format(dateTimeRange.end),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        )
      ],
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
