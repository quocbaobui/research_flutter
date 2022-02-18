
# Research Riverpod
### 1. Provider
- Thư viện quản lý State cho ứng dụng
- Có thể hiểu Provider tương tự InheritedWidget. Widget này sẽ cung cấp object ```(ClassTestA)```) mà có thể sử dụng trong **Widget Tree** được bọc bởi Provider
- Consumer sử dụng để lấy ```(ClassTestA)``` sử dụng
    ```dart
    return Provider<ClassTestA>(
      create: (context) => ClassTestA(),
      child: Consumer<ClassTestA>(builder: (context, classTestA, child) {
        return Scaffold(
          appBar: AppBar(title: Text(" Provider Ex1")),
          body: Center(child: Text("Your name: ${classTestA.getName}")),//Name "QuocBao"
          floatingActionButton: FloatingActionButton(
            child: Text("Name"),
            onPressed: () {
              classTestA.setName("TestA");
            },
          ),
        );
      }),
    );
    ```
   * [```Example: provider1_example.dart```](https://www.google.com)
   
- ChangeNotifierProvider sẽ lắng nghe sự thay đổi của object mà nó cung cấp. Trường hợp ở ```Example: provider1_example.dart``` sẽ không thấy thay đổi Text nên cần sử dụng ChangeNotifierProvider để lắng nghe thay đổi  ```(ClassTestA)```
   * ClassTestA sẽ được viết lại
        ```dart
            class ClassTestAChangeNotifer with ChangeNotifier {
              String _name = "Quoc Bao";
              String get getName => _name;
              void setName(String name) {
                this._name = name;
                print(_name);
                notifyListeners();
              }
            }
        ```
    * Widget viết theo ChangeNotifierProvider
        ```dart
            return ChangeNotifierProvider<ClassTestAChangeNotifer>(
              create: (context3) => ClassTestAChangeNotifer(),
              child: Consumer<ClassTestAChangeNotifer>(
                  builder: (context4, classTestA, child) {
                debugPrint(" Rebuild MyAppProviderEx2 ");
                return Scaffold(
                  appBar: AppBar(title: Text(" Provider MyAppProviderEx2")),
                  body: Center(
                      child: Text(
                          "Your name: ${context4.watch<ClassTestAChangeNotifer>().getName}")),
                  floatingActionButton: FloatingActionButton(
                    child: Text("Name"),
                    onPressed: () {
                      classTestA.setName("Nguyen van Toan");
                    },
                  ),
                );
              }),
            );
        ```
   * [```Example: provider2_example.dart```](https://www.google.com)
    * Cách đọc giá trị object
        * ```context.watch<T>()```, tiện ích sẽ listen các thay đổi trên `<T>`
        * ```context.read<T>()```, tiện ích sẽ trả về  `<T>` và không listen
        * ```contextcontext.select<T, R>(R cb(T value))```, listen một vài giá trị trên `<T>`
        






