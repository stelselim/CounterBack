import 'package:counterback/components/counterCard.dart';
import 'package:counterback/operations/localDB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBody extends StatefulWidget {
  const CalendarBody({Key key}) : super(key: key);

  @override
  _CalendarBodyState createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  var _calendarController;
  Map calendarEvents;
  List todayEvents = [];
  var selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    getDateEvents();
    // events= getDateEvents();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  getDateEvents() async {
    final db = DatabaseOperations();
    var events = await db.getEvents();
    Map<DateTime, List<dynamic>> dates = Map();
    events.forEach((element) {
      var date = DateTime.parse(element["date"]);
      date = DateTime(date.year, date.month, date.day);
      var title = element["title"];

      if (dates.containsKey(date)) {
        var x = dates[date];
        x.add(title);
      } else {
        dates.addAll({
          date: [title]
        });
      }
    });
    setState(() {
      calendarEvents = dates;
    });

    /// Today initial
    if (calendarEvents.containsKey(selectedDate)) {
      setState(() {
        todayEvents = calendarEvents[selectedDate];
      });
    }

    print(dates);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          TableCalendar(
            calendarStyle: CalendarStyle(
                todayColor: Colors.blue.shade100,
                highlightSelected: true,
                highlightToday: true,
                selectedColor: Colors.blue,
                markersColor: Colors.black,
                markersPositionBottom: 6.0),
            events: calendarEvents,
            initialSelectedDay: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ),
            onDaySelected: (time, events) {
              print(events);
              setState(() {
                todayEvents = events;
              });
            },
            calendarController: _calendarController,
          ),
          Divider(),
          SizedBox(
            height: 15,
          ),

          /// Selected Date Items
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: todayEvents.length,
            itemBuilder: (context, index) {
              var title = todayEvents.elementAt(index);

              var year = DateTime.now().year;
              var month = DateTime.now().month;
              var day = DateTime.now().day;

              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 0.5),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(
                    title,
                    textScaleFactor: 1.4,
                  ),
                  subtitle: Text(
                    "$month $day $year",
                    textAlign: TextAlign.right,
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
