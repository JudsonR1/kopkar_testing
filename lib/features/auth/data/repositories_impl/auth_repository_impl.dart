import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<String> login(String username, String password) async {
    try{  
      final deviceIdToken = Platform.operatingSystem;
    final response = await authDataSource.login(username, password,deviceIdToken);
    print("this is device id token"+ deviceIdToken);
    return response.token;
    }
    on DioException catch (e){
    throw Exception("Invalid username or password");
    } on SocketException {
      throw Exception("No internet connection");
    }
  }

  @override
  Future<void> logout() async {}

  @override
  Future<void> register(
    String memberId,
    String email,
    String phone,
    String password,
  ) async {}
}
