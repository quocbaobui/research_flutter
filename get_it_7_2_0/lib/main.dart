import 'package:flutter/material.dart';

import 'example.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MaterialApp(home: MyApp()));
}
