import 'package:flutter/material.dart';

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
    DateTime input= DateTime.parse(date);
    Duration duration = now.difference(input);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      //width: MediaQuery.of(context).size.width*0.8,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
        color: Colors.blueGrey.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              
              title: Text(
                duration.inDays==0?"Today":duration.inDays.toString(),
                textScaleFactor: 4.5,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                "Gün Kaldı",
                textScaleFactor: 1.2,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              title,
              textScaleFactor: 1.6,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
