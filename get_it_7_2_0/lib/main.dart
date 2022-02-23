import 'package:flutter/material.dart';
import 'example.dart';
import 'service_locator.dart';
import 'services/app_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  // getIt.isReady<AppService>().then((_) {
  //   return getIt<AppService>().increaseTotalOpenApp();
  // });

  // // getIt.all
  runApp(MaterialApp(
      home: FutureBuilder(
        // Kiểm tra hoàn thành setupLocator
          future: getIt.allReady(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              getIt.get<AppService>().increaseTotalOpenApp();
              return const WidgetAGetIt();
            } else {
              return Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 8.0),
                    Text("Splash Page")
                  ],
                ),
              );
            }
          })));
}
