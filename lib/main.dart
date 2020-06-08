import 'package:counterback/Pages/addNewEvent.dart';
import 'package:counterback/Pages/calendarBody.dart';
import 'package:counterback/Pages/historyPage.dart';
import 'package:counterback/Pages/mainbody.dart';
import 'package:counterback/colors/primaryColors.dart';
import 'package:counterback/components/appbar.dart';
import 'package:counterback/components/floatingButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primaryColor,
    ),
    home: Main(),
    routes: {
      "/home": (context) => Main(),
      "/add": (context) => NewEventPage(),
    },
  ));
}

class Main extends StatefulWidget {
  const Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int currentIndex = 0;
 
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: mainAppBar(context: context, appBarTitle: "Count To Goal",currentIndex: currentIndex),
        body: currentIndex == 0 ? MainBody() : CalendarBody(),
        floatingActionButton: homeFloatingActionButton(context),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            backgroundColor: Colors.blue.shade500,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            currentIndex: currentIndex,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_view_day),
                title: Text("Events"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                title: Text("Calendar"),
              ),
            ]),
      ),
    );
  }
}
