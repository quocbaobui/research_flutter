import 'package:get_it/get_it.dart';
import 'package:get_it_7_2_0/models/school_model.dart';

GetIt locator = GetIt.instance;

// Đăng ký các types truy cập
void setupLocator() {
  /*
  Singleton Students depends ClassRoom
  Factory ClassRoom depends School
  -> Register School -> ClassRoom -> Students

  */

  //Khởi tạo School trước
  locator.registerSingleton<School>( School(
      address: "Nguyen Huu Canh, HCM", schoolName: "THPT Nguyen Huu Canh"));
  // Đăng ký ClassRom
  locator.registerFactory<ClassRoom>(() =>
      ClassRoom(className: "12A1", grade: "12", school: locator.get<School>()));
  // Đăng ký Students
  locator.registerFactory<Students>(() =>
      Students(name: "QuocBao", age: 18, classRoom: locator.get<ClassRoom>()));
}
