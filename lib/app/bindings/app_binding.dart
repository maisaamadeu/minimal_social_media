import 'package:get/get.dart';
import 'package:minimal_social_media/app/shared/controllers/auth_controller.dart';
import 'package:minimal_social_media/app/shared/controllers/theme_controller.dart';
import 'package:minimal_social_media/app/shared/controllers/user_controller.dart';
import 'package:minimal_social_media/app/shared/controllers/users_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => UsersController());
  }
}
