
# Research InheritedWidget

Cấu trúc UI
Widget A(chứa data) -> Widget B -> Widget C -> Widget(hiển thị data)

### 1. InheritedWidget

- InheritedWidget là một nơi lưu trữ data và cung cấp data cho widget con trong widget tree. Tất cả widget con của InheritedWidget đều có thể truy cập vào InheritedWidget để lấy data.
- Lớp Widget sẽ kế thừa InheritedWidget chứa data và widget con

### 2. Ưu điểm 

- Khi truyền data từ Widget A -> B -> C -> D(hiển thị data) theo cách thông thường phải tạo constructor và truyền thông qua từng widget một
-> Vì vậy InheritedWidget được sử dụng để giải quyết vấn đề trên. Ví dụ Widget D sẽ có thể lấy được data từ Widget A mà không cần tạo constructor truyền qua Widget B và C
Ví dụ: https://github.com/quocbaobui/research_flutter/blob/research-inheritedWidget/inherited/lib/example/normal.dart

- Khi cập nhật dữ liệu từ Widget A cần phải rebuild lại cây widget bao gồm (B,C,D) trong khi đó chúng ta chỉ cần cập nhật dữ liệu ở widget D
-> InheritedWidget sẽ lưu data và cung cấp data cho widget D và không cần rebuild lại widget B và C (B và C sử dụng const để lưu vào cache không cần rebuild lại, giúp tăng hiệu suất)
Ví dụ : https://github.com/quocbaobui/research_flutter/blob/research-inheritedWidget/inherited/lib/example/inherited.dart

### 3. Nhược điểm

- Phải add trực tiếp vào giao diện người dùng và bắt buộc cần "BuildContext" 
- Trong một số trường hợp cần tách biệt với Widget và cần hạn chế sự phụ thuộc vào context
  -> Vì vậy package "get it" giải quyết vấn đề tách biệt khai báo dependency với UI

### 4.Nguồn Tham khảo

- https://medium.com/@mehmetf_71205/inheriting-widgets-b7ac56dbbeb1
- https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html
- https://viblo.asia/p/hoc-flutter-tu-co-ban-den-nang-cao-phan-4-lot-tran-inheritedwidget-3P0lPDbm




