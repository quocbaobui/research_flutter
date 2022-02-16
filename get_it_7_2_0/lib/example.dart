import 'package:flutter/material.dart';

import 'locator.dart';
import 'models/students_model.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //Truy cập lớp Sudents
    Students _student = locator<Students>();
    Students _student2 = locator.get<Students>();

    return Scaffold(
      body: Center(
        child: Text(_student.name + _student2.name),
      ),
    );
  }
}
