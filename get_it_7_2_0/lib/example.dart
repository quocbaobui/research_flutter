import 'package:flutter/material.dart';
import 'package:get_it_7_2_0/models/school_model.dart';
import 'package:get_it_7_2_0/service_locator.dart';

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
    return Scaffold(
      body: const WidgetB(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int _age = locator.get<Students>().age;
          locator.get<Students>().increaseAge(_age + 1);
        },
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
    Students _students = locator.get<Students>();

    debugPrint("Rebuild WidgetD");
    return Center(
      child: Text(_students.toString()),
    );
  }
}
