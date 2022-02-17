# Injectable


### 1. Injectable

- Injectable là convenient code generator cho get it
- Thay vì viết code để đăng ký các dependancy như ở "service_locator" trong example research "get it"
https://github.com/quocbaobui/research_flutter/blob/main/get_it_7_2_0/lib/service_locator.dart
thì với injectable && **build runner** chúng ta chỉ cần thêm các anotation trên các class cần inject thì nó sẽ tự động đăng ký và xử lý
- Hỗ trợ đăng ký trong các môi trường khác nhau test,dev...
- 

### 2. Build Runner

- Build Runner  hỗ trợ generate file bằng Dart.
- Trong Researcb get it & Injectable build runner hỗ trợ tạo file configDependencies thay vì configDependencies bằng cách thủ công

### 3. Cài đặt Injectable
- Setup
    ```yaml  
    import 'service_locator.config.dart';
    
    final getIt = GetIt.instance;  
    @InjectableInit(  
      initializerName: r'$initGetIt',
      preferRelativeImports: true,
      asExtension: false,=
    )  
    void configureDependencies() => $initGetIt(getIt); 
    } 
    ```
- Khi setup sẽ bị báo lỗi tại $initGetIt && import 'injection.config.dart';
. Sau khi Run generator thì sẽ hết lỗi

- Call configureDependencies trước khi Run Ứng dụng
    ```yaml  
    configureDependencies();  
    ```
### 3. Đăng ký với Injectable

- Đăng ký factories
    ```yaml  
    @injectable  
    class AuthService {}
    
    @injectable  
    class AppService {  
        AppService(AuthService authService);  
    }  
    ```
- Đăng ký Singleton && lazySingleton
    ```yaml  
    @singleton  
    class UserRepo {}
    ```
- Dispose Singleton or lazySingleton
   ```yaml  
    @singleton  
    class UserRepo {
        //Dispose
        @disposeMethod  
        void dispose(){  
            // logic to dispose instance  
        }  
    }
    ```
- Register Module
   ```yaml  
    @module  
    abstract class RegisterModule {  
    Future<SharedPreferences> get prefs => SharedPreferences.getInstance();  
    }  
    ```

### 4. Run generator

- Generate file service_locator.config.dart co the sua chua
    ```yaml  
    flutter packages pub run build_runner watch  
    ```

- Generate file service_locator.config.dart chay mot lan
    ```yaml  
    flutter packages pub run build_runner build  
    ```


### Link tham khảo
https://medium.com/flutter-community/part-2-code-generation-in-dart-annotations-source-gen-and-build-runner-bbceee28697b