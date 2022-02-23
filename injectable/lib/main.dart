import 'package:flutter/material.dart';
import 'example.dart';
import 'service_locator.dart';
import 'services/app_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  getIt.get<AppService>().increaseTotalOpenApp();

  runApp(const MaterialApp(home: WidgetA()));
}
