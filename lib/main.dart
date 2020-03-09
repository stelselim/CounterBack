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
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: mainAppBar(appBarTitle: "Count To Goal"),
        body: _index == 0 ? MainBody() : HistoryBody(),
        bottomNavigationBar: BottomNavigationBar(
          // selectedFontSize: MediaQuery.of(context).textScaleFactor*14,
          // unselectedFontSize: MediaQuery.of(context).textScaleFactor*14,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text("Active"),
              icon: Icon(Icons.schedule),
            ),
            BottomNavigationBarItem(
              title: Text("History"),
              icon: Icon(Icons.history),
            ),
          ],
        ),
        floatingActionButton: homeFloatingActionButton(context),
      ),
    );
  }
}
