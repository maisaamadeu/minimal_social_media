import 'package:get/get.dart';
import 'package:minimal_social_media/app/shared/models/user_model.dart';

class UserController extends GetxController {
  final Rx<UserModel?> user = Rx<UserModel?>(null);

  void setUser({UserModel? newUser}) {
    user.value = newUser;
  }
}
