import 'package:flutter/material.dart';
import 'package:injectables/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/app_service.dart';

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WidgetB(),
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
      // child: Container(),
      child: Text("Total Open App: ${getIt.get<AppService>().getTotalOpenApp}"),
    );
  }
}
