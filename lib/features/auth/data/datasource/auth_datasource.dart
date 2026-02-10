import 'package:dio/dio.dart';
import '../model/auth_login_response_model.dart';

class AuthDataSource {
  final Dio dio;

  AuthDataSource(this.dio);

  Future<AuthLoginResponseModel> login(
    String username,
    String password,
    String deviceIdToken,
  ) async {
    final response = await dio.post(
      '/Authentication/login',
      data: {
        'username': username,
        'password': password, 
        'deviceIdToken': deviceIdToken,
      },
    );

    return AuthLoginResponseModel.fromJson(response.data);
  }
}
