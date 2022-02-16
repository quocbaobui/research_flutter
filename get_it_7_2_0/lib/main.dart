import 'package:flutter/material.dart';
import 'example.dart';
import 'service_locator.dart';

void main() {
  setupLocator();
  runApp(const MaterialApp(home: WidgetAGetIt()));
}
