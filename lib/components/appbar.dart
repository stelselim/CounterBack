import 'package:counterback/operations/localDB.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

AppBar mainAppBar(
    {@required String appBarTitle,
    @required BuildContext context,
    int currentIndex}) {
  return AppBar(
    title: Text(appBarTitle),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
        child: currentIndex == 0
            ? IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  size: 35,
                ),
                onPressed: () async {
                  String path = await getDatabasesPath();
                  path = join(path, "events.db");
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text(
                            "All counters are going to be deleted, are you sure?",
                          ),
                          actions: <Widget>[
                            CupertinoButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoButton(
                              child: Text("Delete"),
                              onPressed: () async {
                                await deleteDatabase(path);
                                Fluttertoast.showToast(msg: "Deleted");
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/home", (Route<dynamic> route) => false);
                              },
                            ),
                          ],
                        );
                      });
                },
              )
            : Container(),
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
