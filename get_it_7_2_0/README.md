# Dependency injection with get_it && injectable


### 1. Get it

- Get it là Service Locators (Bộ định vị dịch vụ) 
- Đăng kí các lớp và lấy phiên bản của lớp đó sử dụng
- Tách giao diện khỏi implementation và cho phép truy cập implementation từ mọi nơi trong Ứng dụng

### 2. Registration

- Factory : Khi gọi lấy object thì sẽ trả về một instance mới

- Singleton & LazySingleton : Ngược lại factory, khởi tạo một instance duy nhất và chạy xuyên suốt app. Khi gọi lấy object thì vẫn trả về instance đã tạo trước đó. Dùng trong trường hợp  muốn khởi tạo một lần và dùng ở nhiều chỗ, tránh lãng phí tài nguyên

- LazySingleton sẽ khởi tạo khi instance lần đầu tiên (Dùng trong trường hợp object đó có khả năng sẽ không sử dụng trong trường hợp nào đó, tránh lãng phí tài nguyên)
- Singleton sẽ khởi tạo khi app khởi động





