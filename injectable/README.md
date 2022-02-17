# Injectable


### 1. Injectable

- Injectable là convenient code generator cho get it
- Thay vì viết code để đăng ký các dependancy thay vì viết thủ công như ở "service_locator" trong example research "get it"
thì với injectable && **build runner** chúng ta chỉ cần thêm các anotation trên các class cần inject thì nó sẽ tự động đăng ký và xử lý
- Thường dùng cho các Repo, Service...
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
    preResolve
    Future<SharedPreferences> get prefs => SharedPreferences.getInstance();  
    }  
    ```

### 4. Run generator

- Generate file service_locator.config.dart có thể sửa chữa
    ```yaml  
    flutter packages pub run build_runner watch  
    ```

- Generate file service_locator.config.dart chạy một lần
    ```yaml  
    flutter packages pub run build_runner build  
    ```

### 5. Kết quả file service_locator.config.dart
    ```yaml  
    import 'package:get_it/get_it.dart' as _i1;
    import 'package:injectable/injectable.dart' as _i2;
    import 'package:shared_preferences/shared_preferences.dart' as _i4;

    import 'module/register_module.dart' as _i6;
    import 'services/app_service.dart' as _i5;
    import 'services/auth_service.dart'
        as _i3; // ignore_for_file: unnecessary_lambdas

    // ignore_for_file: lines_longer_than_80_chars
    /// initializes the registration of provided dependencies inside of [GetIt]
    Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
        {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
    final gh = _i2.GetItHelper(get, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AuthService>(() => _i3.AuthService());
    await gh.factoryAsync<_i4.SharedPreferences>(() => registerModule.prefs,
        preResolve: true);
    gh.factory<_i5.AppService>(() => _i5.AppService(get<_i3.AuthService>()));
    return get;
    }

    class _$RegisterModule extends _i6.RegisterModule {}
  
    ```



### Link tham khảo
- https://medium.com/flutter-community/part-2-code-generation-in-dart-annotations-source-gen-and-build-runner-bbceee28697b
- https://pub.dev/packages/get_it
- https://pub.dev/packages/injectable/versions/1.4.1
- https://viblo.asia/p/flutter-dependency-injection-di-that-don-gian-voi-get-it-va-injectable-naQZRLkP5vx
- 