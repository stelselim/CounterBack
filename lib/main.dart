import 'package:counterback/Pages/mainpage.dart';
import 'package:counterback/components/appbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Main(),
    )


  );
}


class Main extends StatelessWidget {
  const Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: mainAppBar(appBarTitle:"Hello Counter"),
        body: MainBody(),
      ),
    );
  }
}

