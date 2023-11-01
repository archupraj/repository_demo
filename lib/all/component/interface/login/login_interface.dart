import 'package:dio/dio.dart';
import 'package:diorepostry/all/component/model/user_model.dart';

abstract class ILogin {
  Future<UserModel?> login(String email, String password) async {
    try {
      final api = 'https://reqres.in/api/login';
      final data = {"email": email, "password": password};
      final dio = Dio();
      final response = await dio.post(api, data: data);

      if (response.statusCode == 200) {
        final body = response.data;
        return UserModel(email: email, token: body['token']);
      }
    } catch (e) {
      print('Error during login: $e');
    }
    return null;
  }
}
