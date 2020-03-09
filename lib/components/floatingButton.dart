import 'package:counterback/colors/primaryColors.dart';
import 'package:flutter/material.dart';

FloatingActionButton homeFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: primaryColor,
    child: Icon(
      Icons.add,
      size: 32,
    ),
    onPressed: ()=>Navigator.pushNamed(context, "/add"),
  );
}
