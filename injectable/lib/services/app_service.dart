import 'package:injectable/injectable.dart';
import 'package:injectables/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppService {
  static const String openAppKey = 'totalOpenApp';
  final SharedPreferences sharedPreferences = getIt.get<SharedPreferences>();

  AppService();

  // @factoryMethod
  // static Future<AppService> initAsync() async {
  //   SharedPreferences _sharedPreferences = getIt.get<SharedPreferences>();
  //   return AppService(_sharedPreferences);
  // }

  int _totalOpenApp = 0;

  int get getTotalOpenApp {
    return _totalOpenApp;
  }

  Future<void> increaseTotalOpenApp() async {
    _totalOpenApp = sharedPreferences.getInt('openAppKey') ?? 0;
    _totalOpenApp = _totalOpenApp + 1;
    sharedPreferences.setInt('openAppKey', _totalOpenApp);
  }
}
