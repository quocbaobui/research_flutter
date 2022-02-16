import 'package:get_it/get_it.dart';

import 'models/students_model.dart';

GetIt locator = GetIt.instance;

// Đăng ký các types truy cập
void setupLocator() {
  locator.registerFactory<Students>(() => Students(age: 18));
}
