import 'package:flutter/material.dart';
import 'package:get_it_7_2_0/models/school_model.dart';

import 'service_locator.dart';
import 'services/app_service.dart';

class WidgetAGetIt extends StatefulWidget {
  const WidgetAGetIt({Key? key}) : super(key: key);
  @override
  _WidgetAGetItState createState() => _WidgetAGetItState();
}

class _WidgetAGetItState extends State<WidgetAGetIt> {
  @override
  void initState() {
    super.initState();
  }

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
    debugPrint("Rebuild WidgetD");
    return Center(
      child: Text("Total Open App: ${getIt.get<AppService>().getTotalOpenApp}"),
    );
  }
}

//  ${getIt.get<AppService>().getTotalOpenApp}