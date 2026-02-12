import 'package:dio/dio.dart';
import '../model/auth_login_response_model.dart';


abstract class AuthDatasource {
  Future<AuthLoginResponseModel> login(String username, String password,  String deviceIdToken);
}

class AuthDataSourceImpl implements AuthDatasource {
  final Dio dio;

  AuthDataSourceImpl(this.dio);

  @override
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
