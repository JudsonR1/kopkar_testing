import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kopkar_testing/core/utils/device_utils.dart';

// Import the domain contract
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final String baseUrl = dotenv.env['API_URL'] ?? '';

  @override
  Future<String> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/Authentication/login'); 

    final String deviceId = await DeviceUtils.getDeviceId();
    print("Logging in with Device ID: $deviceId");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
          'deviceIdToken': deviceId,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String token = data['token']; 
        print("Login Success! Token: $token");
        return token;
      } else if(response.statusCode == 401) {
         final errorData = jsonDecode(response.body);
        throw "Username or Password is incorrect";  
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['error'] ?? "Login failed");
      }
    } catch (e) {
      rethrow;
    }
  }
}