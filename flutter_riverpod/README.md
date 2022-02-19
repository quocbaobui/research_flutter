
# Research Riverpod
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
- [```Example: provider3_example.dart```](https://github.com/quocbaobui/research_flutter/blob/main/flutter_riverpod/lib/provider_exp/provider3_example.dart)    
#### 3. Vì ở trong bất kì class Widget nào ta cũng có thể truy cập vào provider thông qua 
```dart
  Provider.of<AnyType>(context)
```
-  Dễ xảy ra lỗi ProviderNotFoundException khi Run code. 
[```Xem ví dụ "provider3_example.dart"```](https://github.com/quocbaobui/research_flutter/blob/main/flutter_riverpod/lib/provider_exp/provider3_example.dart)
        
- Nguyên nhân chính của vấn đề ProviderNotFoundException là chúng ta xác định không rõ ràng mình đang thao tác ở **BuildContext** nào
  * Chỉ có thể gọi tới ```context4``` để lấy dữ liệu của ClassA && Class B
  * Trường hợp sử dụng ```context2``` ,```context3``` không run code được vì "Undifined"
  * Trường hợp sử dụng ```context```, code sẽ không báo lỗi nhưng khi run sẽ trả ra lỗi **```"ProviderNotFoundException"```** vì chúng ta chỉ có thể truy cập dữ liệu ClassA được bao sau bởi Provider<ClassA>. Mà ```context``` thuộc **WidgetB** và ```Provider<ClassA>``` được bao bởi **WidgetB**
  
- Giải thích cho vấn đề trên

    ![stack Overflow](https://github.com/quocbaobui/research_flutter/blob/research_flutter_riverpod/flutter_riverpod/assets/ex_provider_3_wf..png)



### 3. Riverpod sẽ giúp chúng ta xử lý các vấn đề trên 

- ***"Compile safe"***: Biên dịch an toàn, hạn chế tối đa lỗi "ProviderNotFoundException"
- ***"Provider, without its limitations"*** - Riverpod có hỗ trợ multiple provider có cùng type; kết hợp các providers không đồng bộ & thêm providers từ mọi nơi
- Không phụ thuộc vào BuildContext, có thể listen provider mà không cần BuildContext



        






