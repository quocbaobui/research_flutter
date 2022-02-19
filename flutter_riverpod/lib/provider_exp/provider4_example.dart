import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppProviderEx4 extends StatelessWidget {
  const MyAppProviderEx4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Provider")),
      body: WidgetB(),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context1) => "My String 1",
        child: Builder(
          builder: (context2) => Provider(
            create: (context3) => "My String 2",
            child: Builder(
              builder: (context4) {
                print(context2);
                String dataReceivedCt2 = "${Provider.of<String>(context2)}";
                String dataReceivedCt4 = "${Provider.of<String>(context4)}";
                return Center(
                    child: Text(
                        "dataReceivedCt2 $dataReceivedCt2\ndataReceivedCt4 $dataReceivedCt4"));
              },
            ),
          ),
        ));
  }
}
