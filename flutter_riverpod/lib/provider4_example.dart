import 'package:flutter/material.dart';
import 'package:flutter_riverpod/models/my_class.dart';
import 'package:provider/provider.dart';

class MyAppProviderEx3 extends StatelessWidget {
  const MyAppProviderEx3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod',
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Provider Ex2")),
        body: WidgetB(),
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ClassTestA(),
      child: ProxyProvider<ClassTestA, ClassTestB>(
        update: (context, classTestA, classTestB) => ClassTestB(classTestA),
        child: Builder(
          builder: (context) {
            String dataReceived = Provider.of<ClassTestB>(context).myName;
            return Center(child: Text(dataReceived));
          },
        ),
      ),
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
