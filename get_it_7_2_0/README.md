# Dependency injection with get_it && injectable


### 1. Get it

- Get it là Service Locators (Bộ định vị dịch vụ) 
- Đăng kí các lớp và lấy phiên bản của lớp đó sử dụng
- Tách giao diện khỏi implementation và cho phép truy cập implementation từ mọi nơi trong Ứng dụng
- Bản chất của get it là một Singleton

### 2. Đăng ký

/*
GetIt locator = GetIt.instance;
- Đăng ký Factory
locator.registerFactory<Students>(() => Students());
- Đăng ký SingleTon
locator.registerSingleton<School>(School());
- Đăng ký lazySingleton
locator.registerLazySingleton<ClassRoom>(() => ClassRoom());
*/

- Một class chỉ được đăng ký một lần duy nhất, trường hợp cần thiết phải đăng ký lại đặt allowReassignment = TRUE
locator.allowReassignment = true;

- Xóa đăng ký tất cả
locator.reset();

- Factory : Khi gọi lấy object thì sẽ trả về một instance mới

- Singleton & LazySingleton : Ngược lại factory, khởi tạo một instance duy nhất và chạy xuyên suốt app. Khi gọi lấy object thì vẫn trả về instance đã tạo trước đó. Dùng trong trường hợp  muốn khởi tạo một lần và dùng ở nhiều chỗ, tránh lãng phí tài nguyên

- LazySingleton sẽ khởi tạo khi instance lần đầu tiên (Dùng trong trường hợp object đó có khả năng sẽ không sử dụng trong trường hợp nào đó, tránh lãng phí tài nguyên)

- Singleton sẽ khởi tạo khi app khởi động

### 3. Sủ dụng lấy dữ liệu

- Lấy dữ liệu đồng bộ 
locator.get<T>()  
- Lấy dữ liệu không đồng bộ
locator.getAsync<T>() 


### 4.Nguồn Tham khảo
- https://www.burkharts.net/apps/blog/one-to-find-them-all-how-to-use-service-locators-with-flutter/
- https://www.burkharts.net/apps/blog/lets-get-this-party-started-startup-orchestration-with-getit/
- https://pub.dev/packages/get_it
- https://viblo.asia/p/flutter-dependency-injection-di-that-don-gian-voi-get-it-va-injectable-naQZRLkP5vx














