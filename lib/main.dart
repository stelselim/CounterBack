import 'package:counterback/Pages/addNewEvent.dart';
import 'package:counterback/Pages/historyPage.dart';
import 'package:counterback/Pages/mainbody.dart';
import 'package:counterback/colors/primaryColors.dart';
import 'package:counterback/components/appbar.dart';
import 'package:counterback/components/floatingButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: primaryColor,
    ),
    home: Main(),
    routes: {
      "/home":(context)=>Main(),
      "/add":(context)=>NewEventPage(),
    },
  ));
}

class Main extends StatefulWidget {
  const Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: mainAppBar(context: context,appBarTitle: "Count To Goal"),
        body: MainBody(),
        floatingActionButton: homeFloatingActionButton(context),
      ),
    );
  }
}
