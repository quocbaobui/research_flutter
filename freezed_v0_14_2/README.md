# freezed_v0_14_2

List Lib:
- build_runner: 2.0.4
- freezed: 0.14.2
- json_serializable: ^4.1.2
- freezed_annotation: 0.14.2

#### 1. Giới thiệu 
- Freezed hỗ trợ tạo mã nguồn
- Freezed_annotation hỗ trợ định nghĩa một số annotations của freezed
- build_runner là một package độc lập hỗ trợ tạo các file dart
- json_serializable cung cấp Dart Build System giúp cho quá trình xử lý JSON

#### 2. Setup
- Thêm vào các dependencies vào pubspec.yaml file.

```yaml
dependencies:
  freezed_annotation: 0.14.2
  json_serializable: ^4.1.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  freezed: 0.14.2
  build_runner: 2.0.4
```

#### 3. Triển khai

##### 1. Class UserInternal triển khai theo cách thông thường
- Thông thường chúng ta sẽ code models theo hướng như sau
    ```dart
        class UserInternal {
        String name;
        int? age;
        int userId;

        UserInternal({required this.name, this.age, required this.userId});

        UserInternal.fromJson(Map<String, dynamic> json)
            : name = json['name'],
                age = json['age'],
                userId = json['userId'];

        Map<String, dynamic> toJson() {
            return {'name': name, 'age': age, 'userId': userId};
        }
        }
    ```
##### 2. Class UserInternal triển khai với freezed và json_serializable
- Khởi tạo UserInternalWF
```dart
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_internal_w.freezed.dart';
part 'user_internal_w.g.dart';

@freezed
class UserInternalWF with _$UserInternalWF {
  const UserInternalWF._();

  factory UserInternalWF({
    required String name,
    int? age,
    required int userId,
  }) = _UserInternalWF;

  factory UserInternalWF.fromJson(Map<String, dynamic> json) =>
      _$UserInternalWFFromJson(json);
}
```
- Để khởi chạy quá generation code chạy hàm sau
```dart
flutter pub run build_runner build --delete-conflicting-outputs
```

- Kết quả terminal nhận được
```yaml
[INFO] Generating build script...
[INFO] Generating build script completed, took 587ms

[INFO] Initializing inputs
[INFO] Reading cached asset graph...
[INFO] Reading cached asset graph completed, took 75ms

[INFO] Checking for updates since last build...
[INFO] Checking for updates since last build completed, took 575ms

[INFO] Running build...
[INFO] Running build completed, took 30ms

[INFO] Caching finalized dependency graph...
[INFO] Caching finalized dependency graph completed, took 48ms

[INFO] Succeeded after 95ms with 0 outputs (0 actions)
```
- Sau khi chạy lệnh trên thì trong thư mục models_freezed sẽ thấy thêm 2 file đó là **"user_internal_w.freezed.dart"** và **"user_internal_w.g.freezed.dart"**

##### 3. Một số mã nguồn được freezed thêm vào
- toString();
- toJson();
- So sánh ==
- hashCode
- copyWith()

- Một trong những điểm tiện dụng lớn của freezed là khi chúng ta cần sửa một thuộc tính nào trong các lớp model của mình thì chỉ cần cập nhật lại **factory constructors**. Và chạy lại lệnh 


##### 4. Một số annotations hay gặp khác của Freezed
- @Default sử dụng để chỉ định giá trị mặc định cho thuộc tính đó không được null. Ở ví dụ dưới thì @obtained không null và mặc định luôn là false
```dart
@freezed
abstract class Item implements _$Item {
  const Item._();
  const factory Item({
    String? id,
    required String name,
    @Default(false) bool obtained,
  }) = _Item;
```
- Asserts
    * Thông thường khi cần hỗ trợ kiểm tra các điều kiện ta sẽ chạy như sau
    ```dart
    class Product {
    Product({
        required this.id,
    })  : assert(id > 0);
    final int id;
    }
    ```
    * Freezed hỗ trợ trường hợp này thông qua @Asserts
    ```dart
    @freezed
    abstract class Product with _$Product {
    @Assert('id > 0')
    factory Product({required int id}) = _Product;
    }
    ```



