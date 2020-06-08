import 'package:counterback/operations/localDB.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';

class CounterCard extends StatelessWidget {
  final String title;
  final String date;

  CounterCard({
    @required this.date,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime input = DateTime.parse(date);
    Duration duration = now.difference(input);
    DateTime special = DateTime(DateTime.now().year, 5, 17);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      //width: MediaQuery.of(context).size.width*0.8,
      height: MediaQuery.of(context).size.height * 0.29,
      child: Card(
        color: special != DateTime.parse(date)
            ? Colors.lightBlueAccent.shade50
            : Colors.lightBlueAccent.shade50,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: IconButton(
                        icon: Icon(Icons.info_outline),
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "Double Tap to Change",
                              gravity: ToastGravity.CENTER);
                        },
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        tooltip: 'Delete',
                        onPressed: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: Text(
                                  "This Counter is going to be deleted, are you sure?"),
                              actions: <Widget>[
                                CupertinoButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoButton(
                                  child: Text("Delete"),
                                  onPressed: () async {
                                    await DatabaseOperations()
                                        .deleteAnEvent(title);
                                    Fluttertoast.showToast(msg: "Deleted");
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil("/home",
                                            (Route<dynamic> route) => false);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      duration.inDays == 0
                          ? "Today"
                          : duration.inDays.abs().toString(),
                      textScaleFactor: 4.0,
                      style: TextStyle(
                          color: special == DateTime.parse(date)
                              ? Colors.blue
                              : null),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: duration.inDays == 0
                        ? null
                        : Text(
                            duration.inDays < 0 ? "Days Left" : "Days Ago",
                            style: TextStyle(
                                color: special == DateTime.parse(date)
                                    ? Colors.blue
                                    : null),
                            textScaleFactor: 1.4,
                            textAlign: TextAlign.center,
                          ),
                  ),
                  Text(
                    title,
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      color: special == DateTime.parse(date)
                          ? Colors.blue.shade600
                          : null,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
