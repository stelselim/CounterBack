import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final cardData;

  CounterCard({
    this.cardData,
  });

  @override
  Widget build(BuildContext context) {
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
                "450",
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
              "Javascript Phase",
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
