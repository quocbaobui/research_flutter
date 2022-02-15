import 'package:flutter/material.dart';

class NameCounter extends InheritedWidget {
  final String name;
  final int counter;

  const NameCounter(
      {required this.name, required this.counter, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(NameCounter oldWidget) {
    // return true -> rebuild widget
    // return false -> không rebuild
    // Một số trường hợp data  không cần rebuild lại UI xử lí trong đây
    return counter != oldWidget.counter;
  }

  // Sử dụng static để gọi ở bất cứ widget con nào để lấy dữ liệu NameCounter
  static NameCounter of(BuildContext context) {
    final NameCounter? result =
        context.dependOnInheritedWidgetOfExactType<NameCounter>();
    assert(result != null, 'No NameCounter found in context');
    return result!;
  }
}

class WidgetAWithInheritedWidget extends StatefulWidget {
  const WidgetAWithInheritedWidget({Key? key}) : super(key: key);
  @override
  _WidgetAWithInheritedWidgetState createState() =>
      _WidgetAWithInheritedWidgetState();
}

class _WidgetAWithInheritedWidgetState
    extends State<WidgetAWithInheritedWidget> {
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
      body: NameCounter(
        child: const WidgetB(),
        counter: counter,
        name: name,
      ),
    );
  }
}

// Widget B
class WidgetB extends StatelessWidget {
  const WidgetB();
  @override
  Widget build(BuildContext context) {
    print("Rebuild WidgetB");
    return SizedBox(child: WidgetC());
  }
}

// Widget C
class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Rebuild WidgetC");
    return SizedBox(child: WidgetD());
  }
}

// Widget D
class WidgetD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Rebuild WidgetD");
    return Center(
      child: Text(
          "${NameCounter.of(context).name} - ${NameCounter.of(context).counter}"),
    );
  }
}
