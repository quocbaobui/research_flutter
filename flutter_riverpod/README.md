
# Research Riverpod
### 1. Provider
- Thư viện quản lý State cho ứng dụng
- Có thể hiểu Provider là một cải tiến củaInheritedWidget. Widget này sẽ cung cấp object ```(ClassTestA)```) mà có thể sử dụng trong **Widget Tree** được bọc bởi Provider
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
### 3. Nhược điểm của Provider 
-   Vì nó dựa trên InheritedWidget nên vẫn phụ thuộc vào **Widget tree**
-   Triển khai Provider phụ thuộc Provider dài dòng
    * Ví dụ ta có ClassTestB phụ thuộc vào ClassTestA
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
    *  ClassB cần có ClassA để khởi tạo Provider nên cần sử dụng ```MultiProvider``` hoặc ```ProxyProvider``` để khởi chạy. Dưới đây xử dụng **ProxyProvider**
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
   * [```Example: provider2_example.dart```](https://www.google.com)    
- Vì ở trong bất kì class Widget nào ta cũng có thể truy cập vào provider thông qua 
```dart
  Provider.of<AnyType>(context)
```
 Dễ sảy ra ProviderNotFoundException trở thành vấn đề lớn  nếu ứng dụng phình to ra. Ở ví dụ trên ta dễ dàng thấy 
         * Khi lấy @myName từ class ClassTestB nếu ta truyền nhầm ```context``` thay vì ```context4``` thì trình biên dịch sẽ không báo lỗi, nhưng khi run app thì sẽ báo lỗi ```"Could not find the correct Provider<ClassTestB> above this WidgetB Widget"```
         * Lấy dữ liệu  sai 
        ```dart
            Provider.of<ClassTestB>(context).myName;
        ```
        * Lấy dữ liệu đúng 
        ```dart
            Provider.of<ClassTestB>(context).myName;
        ```

### => Vì những nhược điểm trên nên việc sử dụng Riverpod sẽ giúp ứng dụng hoàn toàn độc lập với Widget tree


        






