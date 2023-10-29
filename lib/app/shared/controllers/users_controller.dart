import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:minimal_social_media/app/shared/models/user_model.dart';
import 'package:minimal_social_media/app/shared/repositories/users_repository.dart';

class UsersController extends GetxController {
  final RxList users = [].obs;
  final RxBool isLoading = true.obs;

  void getUsers() async {
    isLoading(true);
    final List<dynamic>? result = await UsersRepository(dio: Dio()).getUsers();

    if (result != null) {
      for (var user in result) {
        users.add(UserModel.fromJson(user));
      }
    }

    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }
}
