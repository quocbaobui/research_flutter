import 'package:injectable/injectable.dart';

import 'auth_service.dart';

@injectable
class AppService {
  final AuthService authService;
  AppService(this.authService);
}
