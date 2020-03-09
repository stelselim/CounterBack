import 'package:counterback/components/counterCard.dart';
import 'package:flutter/material.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CounterCard(),
          );
        },
      ),
    );
  }
}
