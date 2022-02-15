import 'package:flutter/material.dart';

class WidgetA extends StatefulWidget {
  const WidgetA({Key? key}) : super(key: key);
  @override
  _WidgetAState createState() => _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {
  String name = "Quoc Bao";
  int counter = 0;

  increase() {
    setState(() {
      counter++;
      print(counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild WidgetA");
    return Scaffold(
      appBar: AppBar(
        title: Text("$name"),
        actions: [
          IconButton(
              onPressed: () {
                increase();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: WidgetB(name: name, counter: counter),
    );
  }
}

// Widget B
class WidgetB extends StatelessWidget {
  final String name;
  final int counter;
  // Khởi tạo constructor để truyền qua
  const WidgetB({Key? key, required this.name, required this.counter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Rebuild lại khi widget A setState
    print("Rebuild WidgetB");
    return WidgetC(name: name, counter: counter);
  }
}

// Widget C
class WidgetC extends StatelessWidget {
  final String name;
  final int counter;
  // Khởi tạo constructor để truyền qua
  const WidgetC({Key? key, required this.name, required this.counter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Rebuild lại khi widget A setState
    print("Rebuild WidgetC");
    return WidgetD(name: name, counter: counter);
  }
}

// Widget D
class WidgetD extends StatelessWidget {
  final String name;
  final int counter;
  // Khởi tạo constructor để truyền qua
  const WidgetD({Key? key, required this.name, required this.counter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Rebuild lại khi widget A setState
    print("Rebuild WidgetD");
    return Center(
      child: Text("$name - $counter"),
    );
  }
}
