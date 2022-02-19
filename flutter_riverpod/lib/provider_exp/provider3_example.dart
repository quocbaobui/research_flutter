import 'package:flutter/material.dart';
import 'package:flutter_riverpods/models/my_class.dart';
import 'package:provider/provider.dart';

class MyAppProviderEx3 extends StatelessWidget {
  const MyAppProviderEx3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod',
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Provider Ex3")),
        // Use ProxyProvider
        body: WidgetB(),
        //Use MultiProvider
        // body: WidgetC(),
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context2) => ClassTestA(),
      child: ProxyProvider<ClassTestA, ClassTestB>(
        update: (context3, classTestA, classTestB) => ClassTestB(classTestA),
        child: Builder(
          builder: (context4) {
            String _name = Provider.of<ClassTestB>(context4).myName;
            String _age = Provider.of<ClassTestA>(context4).getAge.toString();
            return Center(child: Text("$_name - Age $_age "));
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
    return MultiProvider(
      providers: [
        Provider<ClassTestA>(
          create: (context1) => ClassTestA(),
        ),
        ProxyProvider<ClassTestA, ClassTestB>(
          update: (context2, classTestA, classTestB) => ClassTestB(classTestA),
        )
      ],
      builder: (context3, child) {
        String _name = Provider.of<ClassTestB>(context3).myName;
        String _age = Provider.of<ClassTestA>(context3).getAge.toString();
        return Center(child: Text("$_name - Age $_age "));
      },
    );
  }
}
