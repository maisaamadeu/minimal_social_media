import 'package:dio/dio.dart';
import 'package:minimal_social_media/app/shared/private/back_4_app_headers.dart';

class UsersRepository {
  final Dio dio;

  UsersRepository({required this.dio});

  Future<List<dynamic>?> getUsers() async {
    final result = await dio.post(
      'https://parseapi.back4app.com/functions/get-users',
      options: Options(
        contentType: 'application/json',
        headers: {
          'X-Parse-Application-Id': Back4AppHeaders().xParseApplicationId,
          'X-Parse-REST-API-Key': Back4AppHeaders().xParseRestApiKey,
        },
      ),
    );

    if (result.statusCode == 200) {
      return result.data['result'] as List<dynamic>;
    }

    return null;
  }

  Future<List<String>?> getUsernames() async {
    final result = await dio.post(
      'https://parseapi.back4app.com/functions/get-usernames',
      options: Options(
        contentType: 'application/json',
        headers: {
          'X-Parse-Application-Id': Back4AppHeaders().xParseApplicationId,
          'X-Parse-REST-API-Key': Back4AppHeaders().xParseRestApiKey,
        },
      ),
    );

    if (result.statusCode == 200) {
      List<String> usernames = [];
      for (Map<String, dynamic> username in result.data['result']) {
        usernames.add(username['username']);
      }

      return usernames;
    }

    return null;
  }

  Future<List<String>?> getEmails() async {
    final result = await dio.post(
      'https://parseapi.back4app.com/functions/get-emails',
      options: Options(
        contentType: 'application/json',
        headers: {
          'X-Parse-Application-Id': Back4AppHeaders().xParseApplicationId,
          'X-Parse-REST-API-Key': Back4AppHeaders().xParseRestApiKey,
        },
      ),
    );

    if (result.statusCode == 200) {
      List<String> emails = [];
      for (Map<String, dynamic> email in result.data['result']) {
        emails.add(email['email']);
      }

      return emails;
    }

    return null;
  }
}
