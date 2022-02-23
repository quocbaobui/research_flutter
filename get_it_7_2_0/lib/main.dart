import 'package:flutter/material.dart';
import 'example.dart';
import 'models/school_model.dart';
import 'service_locator.dart';

void main() {
  setupLocator();

  // Tăng thêm 1 tuổi
  locator.get<Students>().increaseAge(locator.get<Students>().age + 1);

  runApp(const MaterialApp(home: WidgetAGetIt()));
}
