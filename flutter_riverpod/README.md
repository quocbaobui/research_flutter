
# Research Provider và những điểm yếu của Provider

### 1. Provider
- Thư viện quản lý State cho ứng dụng
- Có thể hiểu Provider là một cải tiến của InheritedWidget. Widget này sẽ cung cấp object ```(ClassTestA)```) mà có thể sử dụng trong **Widget Tree** được bọc bởi Provider
- Consumer sử dụng để lấy object ```(ClassTestA)```
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
   * [```Example: provider1_example.dart```](https://github.com/quocbaobui/research_flutter/blob/main/flutter_riverpod/lib/provider_exp/provider1_example.dart)
   
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
   * [```Example: provider2_example.dart```](https://github.com/quocbaobui/research_flutter/blob/main/flutter_riverpod/lib/provider_exp/provider2_example.dart)
    * Cách đọc giá trị object
        * ```context.watch<T>()```, tiện ích sẽ listen các thay đổi trên `<T>`
        * ```context.read<T>()```, tiện ích sẽ trả về  `<T>` và không listen
        * ```contextcontext.select<T, R>(R cb(T value))```, listen một vài giá trị trên `<T>`

### 2. Nhược điểm của Provider 
##### 1. Vì nó dựa trên InheritedWidget nên vẫn phụ thuộc vào ```Widget tree```
##### 2. Triển khai Provider phụ thuộc vào Provider khác dài dòng. Và sẽ trở thành vấn đề lớn nếu ứng dụng có nhiều Provider phụ thuộc lẫn nhau
-  Ví dụ ta có ClassTestB phụ thuộc vào ClassTestA
    ```dart
    class ClassTestA {
      String _name = "Quoc Bao";
      int _age = 18;
      
      int get getAge => _age;
      set age(int age) {
        _age = age;
      }
      String get getName => _name;
      void setName(String name) {
        this._name = name;
        print(_name);
      }
    }
    class ClassTestB {
      final ClassTestA myFirstClass;
      ClassTestB(this.myFirstClass);
      String get myName => "My name ${myFirstClass.getName}";
    }
    ```
- ClassB cần có ClassA để khởi tạo Provider nên cần sử dụng ```MultiProvider``` hoặc ```ProxyProvider``` để khởi chạy.
    ```dart
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
    ```
- [```Example: provider3_example.dart```](https://github.com/quocbaobui/research_flutter/blob/main/flutter_riverpod/lib/provider_exp/provider4_example.dart)    
#### 3. Vì ở trong bất kì class Widget nào ta cũng có thể truy cập vào provider thông qua **```Provider.of<AnyType>(context)```** nên dễ xảy ra lỗi ProviderNotFoundException khi Run code.
- [```Xem ví dụ "provider3_example.dart"```](https://github.com/quocbaobui/research_flutter/blob/main/flutter_riverpod/lib/provider_exp/provider3_example.dart)

   ![stack Overflow](https://raw.githubusercontent.com/quocbaobui/research_flutter/research_flutter_riverpod/flutter_riverpod/assets/ex_provider_3_wf.png)
- Nguyên nhân chính của vấn đề ProviderNotFoundException là chúng ta xác định không rõ ràng mình đang thao tác ở **BuildContext** nào
  * Chỉ có thể gọi tới ```context4``` để lấy dữ liệu của ClassA && Class B
  * Trường hợp sử dụng ```context2``` ,```context3``` không run code được vì "Undifined"
  * Trường hợp sử dụng ```context```, code sẽ không báo lỗi nhưng khi run sẽ trả ra lỗi **```"ProviderNotFoundException"```** vì chúng ta chỉ có thể truy cập dữ liệu ClassA được bọc trong Provider<ClassA>. Mà ```context``` thuộc **WidgetB** và ```Provider<ClassA>``` được bọc trong **WidgetB**
- [```Tham khảo thêm ở ví dụ  "provider4_example.dart"```](https://github.com/quocbaobui/research_flutter/blob/main/flutter_riverpod/lib/provider_exp/provider4_example.dart)
    ```dart
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
    ```
    * **Provider.of<String>(context)** -> Không báo lỗi nhưng khi biên dịch trả về **```"ProviderNotFoundException"```** 
    * Trường hợp sử dụng ```context1``` ,```context3``` không run code được vì "Undifined"
    * **Provider.of<String>(context2)** -> Trả về "My String 1"
    * **Provider.of<String>(context4)** -> Trả về "My String 2"


### 3. Riverpod sẽ giúp chúng ta xử lý các vấn đề trên 

- ***"Compile safe"***: Biên dịch an toàn, hạn chế tối đa lỗi "ProviderNotFoundException"
- ***"Provider, without its limitations"*** - Riverpod có hỗ trợ multiple provider có cùng type. Kết hợp các providers không đồng bộ & thêm providers từ mọi nơi
- ***Không phụ thuộc vào BuildContext***, có thể listen provider mà **```không cần BuildContext```**



# Research Flutter Riverpod 1.0.0

### 1. Riverpod 

- Riverpod hỗ trợ quản lý State trong ứng dụng và hoạt động hoàn toàn độc lập với Widget-tree. Giúp việc tách biệt logic ra khỏi Widget
- Bắt lỗi ngay tại thời điểm biên dịch thay vì sau khi Run code 
- Riverpod sử dụng watch() để truy cập tới các Provider. Vì thế có thể có nhiều Provider cùng type
- Ứng dụng sẽ được bọc trong **ProviderScope**
```dart
void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    title: 'Flutter Riverpod',
    home: MyAppRiverpodEx1ConsumerWidget(),
  )));
}
```

### 2. Triển khai lại các example Provider bằng RiverPod

#### 1. Provider1 - Example, Consumer & ConsumerWidget

- Thay vì bọc Provider trong widget như ở [```Example: provider1_example.dart```](https://github.com/quocbaobui/research_flutter/blob/main/flutter_riverpod/lib/provider_exp/provider1_example.dart) đối với Riverpod chúng ta có thể khai báo Provider classTestA như sau
  ```dart
  Provider<ClassTestA>  classAProvider = Provider<ClassTestA>((ref) => ClassTestA());
  ```
- Sử dụng Consumer để lấy giá trị object như Provider
  ```dart
  class MyAppRiverpodEx1Comsumer extends StatelessWidget {
    const MyAppRiverpodEx1Comsumer({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
      // Lay du lieu tu classA
      return Consumer(
        builder: (context1, ref, child) {
          String _name = ref.watch(classAProvider).getName;
          return Scaffold(
            appBar: AppBar(title: Text("Flutter RiverPod Ex1")),
            body: Center(child: Text("Your name: $_name")),
            floatingActionButton: FloatingActionButton(
              child: Text("Name"),
              onPressed: () {
                ref.read(classAProvider).setName("Nguyen van Toan");
              },
            ),
          );
        },
      );
    }
  }
  ```
- Tuy nhiên việc sử dụng Consumer để lấy giá trị object sẽ tạo ra thêm  **```context1```** và khiến code dài dòng hơn. Trong khi đó **Riverpod có hỗ trợ ConsumerWidget**. Ví dụ trên có thể viết lại với ConsumerWidget như sau
  ```dart
    class MyAppRiverpodEx1ConsumerWidget extends ConsumerWidget {
      const MyAppRiverpodEx1ConsumerWidget({Key? key}) : super(key: key);
      @override
      Widget build(BuildContext context, WidgetRef ref) {
        // Lay du lieu tu classA
        String _name = ref.watch(classAProvider).getName;
        return Scaffold(
          appBar: AppBar(title: Text("Flutter RiverPod Ex1")),
          body: Center(child: Text("Your name: $_name")),
          floatingActionButton: FloatingActionButton(
            child: Text("Name"),
            onPressed: () {
              ref.read(classAProvider).setName("Nguyen Van Toan");
            },
          ),
        );
      }
    }
  ```

- Ở ví dụ này sẽ không update được state vì khi ta nhấn vào FloatingActionButton thì **ref.watch(classAProvider).getName** sẽ không nhận được giá trị mới là "Nguyen Van Toan"

- [```Xem ví dụ "riverpod1_example.dart"```](google.com)

#### 2. Provider2 - Example Update State với ChangeNotifierProvider

- Ở phần Provider khi cần cập nhật dữ liệu của object trong [```Example: provider2_example.dart```](https://github.com/quocbaobui/research_flutter/blob/main/flutter_riverpod/lib/provider_exp/provider2_example.dart) chúng ta sử dụng **ChangeNotifierProvider** và classTestA được viết lại với **ChangeNotifier**
- Riverpod ChangeNotifierProvider khai báo như sau
  ```dart
  ChangeNotifierProvider<ClassTestAChangeNotifer> classAChangeNotifierProvider =
    ChangeNotifierProvider<ClassTestAChangeNotifer>(
        (ref) => ClassTestAChangeNotifer());
  ```
- UI triển khai với ConsumerWidget
  ```dart
  class MyAppRiverpodEx2StateProvider extends ConsumerWidget {
    const MyAppRiverpodEx2StateProvider({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context, WidgetRef ref) {
      return Scaffold(
        appBar: AppBar(title: Text(" Flutter RiverPod Ex2")),
        body: Center(
            child: Text(
                "Your name: ${ref.watch(classAChangeNotifierProvider).getName}")),
        floatingActionButton: FloatingActionButton(
          child: Text("Name"),
          onPressed: () {
            ref.read(classAChangeNotifierProvider).setName("Nguyen van Toan");
          },
        ),
      );
    }
  }
  ```
- Sau khi click vào FloatingActionButton thì **ref.watch(classAChangeNotifierProvider).getName** sẽ trả về giá trị mới đó là "Nguyen Van Toan"

- [```Xem ví dụ "riverpod2_example.dart"```](google.com)

### 3. Triển khai Provider phụ thuộc vào Provider với Riverpod
- Đối với Provider khi triển khai UI chúng ta cần lồng các Provier với nhau và sử dụng ProxyProvider như ở [```Ví dụ provider3_example.dart```](https://github.com/quocbaobui/research_flutter/blob/main/flutter_riverpod/lib/provider_exp/provider3_example.dart)
- Sử dụng Riverpod khai báo như sau
  ```dart
  Provider<ClassTestA> classTestAProvider = Provider<ClassTestA>((ref) {
  return ClassTestA();
  });
  Provider<ClassTestB> classTestBProvider = Provider<ClassTestB>((ref) {
    ClassTestA _classA = ref.read(classTestAProvider);
    return ClassTestB(_classA);
  });
  ```
- UI triển khai với ConsumerWidget. Việc triển khai với Riverpod sẽ khiến code ngắn ngọn hơn và dễ đọc hơn
  ```dart
  class WidgetB extends ConsumerWidget {
    const WidgetB({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context, WidgetRef ref) {
      String _name = ref.watch(classTestBProvider).myName;
      String _age = ref.watch(classTestAProvider).getAge.toString();
      return Center(child: Text("$_name - Age $_age "));
    }
  }
  ```

        






