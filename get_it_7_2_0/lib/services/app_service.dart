import 'package:shared_preferences/shared_preferences.dart';

class AppService {
  static const String openAppKey = 'totalOpenApp';
  final SharedPreferences sharedPreferences;

  AppService(this.sharedPreferences);

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
