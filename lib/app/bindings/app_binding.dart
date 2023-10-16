import 'package:get/get.dart';
import 'package:minimal_social_media/app/shared/controllers/theme_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
  }
}
