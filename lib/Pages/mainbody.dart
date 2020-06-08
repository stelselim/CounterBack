import 'package:counterback/components/counterCard.dart';
import 'package:counterback/operations/localDB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    final dbOperations = DatabaseOperations();
    return Container(
      color: Colors.blue.shade100,
      child: StreamBuilder<List<Map<String, dynamic>>>(
        stream: dbOperations.getEvents().asStream(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text("Problem"),
            );
          if (snapshot.data == null)
            return Center(child: CircularProgressIndicator());
          List<Map<String, dynamic>> listOfEvents = snapshot.data;
          return ListView.builder(
              itemCount: listOfEvents.length,
              itemBuilder: (context, index) {
                Map events =
                    listOfEvents.elementAt(listOfEvents.length - index - 1);

                DateTime date = DateTime.parse(events["date"]);
                int day = date.day;
                int month = date.month;
                int year = date.year;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onDoubleTap: () async {
                      try {
                        var _time = await DatePicker.showDatePicker(
                          context,
                          maxTime: DateTime(DateTime.now().year + 5),
                        );

                        if (_time != null) {
                          print(_time);
                          var newEvent = Event(date: _time.toIso8601String(),title: events["title"]);
                          await DatabaseOperations().updateEvent(newEvent);
                          setState((){});
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: "$month - $day - $year",
                        gravity: ToastGravity.CENTER,
                        fontSize: 25,
                        backgroundColor: Colors.blue.shade800,
                      );
                    },
                    child: CounterCard(
                      title: events["title"],
                      date: events["date"],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
