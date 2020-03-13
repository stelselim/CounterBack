import 'package:counterback/operations/localDB.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

AppBar mainAppBar(
    {@required String appBarTitle, @required BuildContext context}) {
  return AppBar(
    title: Text(appBarTitle),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          String path = await getDatabasesPath();
          path = join(path, "events.db");
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ListTile(
                            title: Text(
                                "All Events are going to be deleted, are you sure?")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                 Navigator.pop(context);
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FlatButton(
                              child: Text("Delete"),
                              onPressed: () async{
                                 await deleteDatabase(path);
                                 Fluttertoast.showToast(msg: "Deleted");
                                 Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      )
    ],
    centerTitle: true,
  );
}

AppBar newAppBar({@required String appBarTitle}) {
  return AppBar(
    title: Text(appBarTitle),
    actions: <Widget>[],
    centerTitle: true,
  );
}
