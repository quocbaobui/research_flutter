import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/my_class.dart';

class MyAppProviderEx2 extends StatelessWidget {
  const MyAppProviderEx2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context1) {
    return ChangeNotifierProvider<ClassTestAChangeNotifer>(
      create: (context3) => ClassTestAChangeNotifer(),
      child: Consumer<ClassTestAChangeNotifer>(
          builder: (context4, classTestA, child) {
        debugPrint(" Rebuild MyAppProviderEx2 ");
        return Scaffold(
          appBar: AppBar(title: Text(" Provider MyAppProviderEx2")),
          body: Center(
              child: Text(
                  "Your name: ${context4.read<ClassTestAChangeNotifer>().getName}")),
          floatingActionButton: FloatingActionButton(
            child: Text("Name"),
            onPressed: () {
              classTestA.setName("Nguyen van Toan");
            },
          ),
        );
      }),
    );
  }
}


//   @override
//   Widget build(BuildContext context1) {
//     return ChangeNotifierProvider<ClassTestAChangeNotifer>(
//       create: (context3) => ClassTestAChangeNotifer(),
//       child: Consumer<ClassTestAChangeNotifer>(
//           builder: (context4, classTestA, child) {
//         debugPrint(" Rebuild MyAppProviderEx2 ");
//         return Scaffold(
//           appBar: AppBar(title: Text(" Provider MyAppProviderEx2")),
//           body: Center(
//               child: Text(
//                   "Your name: ${context4.read<ClassTestAChangeNotifer>().getName}")),
//           floatingActionButton: FloatingActionButton(
//             child: Text("Name"),
//             onPressed: () {
//               classTestA.setName("Nguyen van Toan");
//             },
//           ),
//         );
//       }),
//     );
//   }
// }
