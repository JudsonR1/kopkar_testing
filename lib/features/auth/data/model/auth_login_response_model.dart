class AuthLoginResponseModel {
  final String token;
  final DateTime expiration;
  final bool isResetPassword;

  AuthLoginResponseModel({
    required this.token,
    required this.expiration,
    required this.isResetPassword,
  });

  factory AuthLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthLoginResponseModel(
      token: json['token'],
      expiration: DateTime.parse(json['expiration']),
      isResetPassword: json['isResetPassword'],
    );
  }
}
