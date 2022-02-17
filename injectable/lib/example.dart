import 'package:flutter/material.dart';
import 'package:injectables/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetAGetIt extends StatefulWidget {
  const WidgetAGetIt({Key? key}) : super(key: key);
  @override
  _WidgetAGetItState createState() => _WidgetAGetItState();
}

class _WidgetAGetItState extends State<WidgetAGetIt> {
  @override
  void initState() {
    // RegisterModule _registerModule = getIt.get<RegisterModule>();
    SharedPreferences sharedPreferences = getIt.get<SharedPreferences>();
    sharedPreferences.setInt("test", 15);
    // AuthService authService = getIt<AuthService>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const WidgetB(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

// Widget B
class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("Rebuild WidgetB");
    return const SizedBox(child: WidgetC());
  }
}

// Widget C
class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("Rebuild WidgetC");
    return const SizedBox(child: WidgetD());
  }
}

// Widget D
class WidgetD extends StatelessWidget {
  const WidgetD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // );
    debugPrint("Rebuild WidgetD");
    return Center(
      child: Text(
          "Getit Injection test ${getIt.get<SharedPreferences>().getInt("test")}"),
    );
  }
}
