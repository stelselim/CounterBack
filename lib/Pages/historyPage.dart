import 'package:counterback/components/counterCard.dart';
import 'package:counterback/operations/localDB.dart';
import 'package:flutter/material.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({Key key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    final dbOperations = DatabaseOperations();
    return Container(
      color: Colors.blue.shade200,
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
                Map events = listOfEvents.elementAt(index);

                return CounterCard(
                  title: events["title"],
                  date: events["date"],
                );
              });
        },
      ),
    );
  }
}
