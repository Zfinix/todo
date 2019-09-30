import 'package:flutter/material.dart';
import 'package:todo/views/detailsPage.dart';
import 'package:todo/views/homePage.dart';

import 'views/newPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff5886ff),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
