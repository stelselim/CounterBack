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
  final formKey = GlobalKey<FormState>();
   DateTime _time;
  String eventName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: newAppBar(appBarTitle: "New Event"),
        body: Container(
          child: Form(
            key: formKey,
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
                        onSaved: (value) => eventName=value,
                        validator: (value) =>
                            value.isNotEmpty ? null : "Please Enter an Event",
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
                    child: Text(
                      "Select a specific date",
                      textScaleFactor: 1.8,
                    ),
                    onPressed: () async {
                      _time = await DatePicker.showDatePicker(
                        context,
                        maxTime: DateTime(DateTime.now().year + 5),
                      );
                      if (_time != null) {
                        print(_time);
                      }
                    },
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
                            if(_time==null) Fluttertoast.showToast(msg: "Select a specific date",gravity: ToastGravity.CENTER);
                            if (formKey.currentState.validate() && _time!=null) {
                              formKey.currentState.save();
                              print(eventName);
                              print(_time);                              
                              Fluttertoast.showToast(msg: "Added New Event");
                              Navigator.pop(context);
                            }
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
