import 'package:counterback/colors/primaryColors.dart';
import 'package:counterback/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewEventPage extends StatefulWidget {
  NewEventPage({Key key}) : super(key: key);

  @override
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: newAppBar(appBarTitle: "New Event"),
        body: Container(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        maxLines: 1,
                        maxLength: 40,
                        maxLengthEnforced: true,
                        decoration: InputDecoration(
                          hintText: "Event Name",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: FlatButton(
                    colorBrightness: Brightness.light,
                   // color: Colors.blueGrey.shade50,
                   // elevation: 2,
                    child: Text("Select a specific date",textScaleFactor: 1.8,),
                    onPressed: () => DatePicker.showDatePicker(
                      context,
                      maxTime: DateTime(DateTime.now().year + 5),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                          colorBrightness: Brightness.light,
                          //color: Colors.blueGrey.shade100,
                          elevation: 5,
                          child: Text("Cancel"),
                          onPressed: () => Navigator.pop(context)),
                      SizedBox(
                        width: 35,
                      ),
                      RaisedButton(
                          colorBrightness: Brightness.light,
                          // color: Colors.blue.shade50,
                          elevation: 5,
                          child: Text("Add"),
                          onPressed: () {
                            Fluttertoast.showToast(msg: "Added New Event");
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
