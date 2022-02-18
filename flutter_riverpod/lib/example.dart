import 'package:flutter/material.dart';

class MyAppRiverpod extends StatelessWidget {
  const MyAppRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod',
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter_Riverpod 1.0.0")),
        body: WidgetB(),
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
