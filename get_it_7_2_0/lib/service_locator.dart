import 'package:get_it/get_it.dart';
import 'package:get_it_7_2_0/models/school_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/app_service.dart';

GetIt getIt = GetIt.instance;

// Đăng ký các types truy cập
Future<void> setupLocator() async {
  getIt.registerSingletonAsync<AppService>(() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // ...truyền vào hàm khởi tạo của AppService
    return AppService(sharedPreferences);
  });


  /*
  Singleton Students depends ClassRoom
  Factory ClassRoom depends School
  -> Register School -> ClassRoom -> Students
  */
  // locator.registerSingleton<School>(School(
  //     address: "Nguyen Huu Canh, HCM", schoolName: "THPT Nguyen Huu Canh"));
  // // Đăng ký ClassRom
  // locator.registerFactory<ClassRoom>(() =>
  //     ClassRoom(className: "12A1", grade: "12", school: locator.get<School>()));
  // // Đăng ký Students
  // locator.registerSingleton<Students>(
  //     Students(name: "QuocBao", age: 18, classRoom: locator.get<ClassRoom>()));
}
