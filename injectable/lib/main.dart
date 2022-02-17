import 'package:flutter/material.dart';
import 'example.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(MaterialApp(home: WidgetAGetIt()));
}
