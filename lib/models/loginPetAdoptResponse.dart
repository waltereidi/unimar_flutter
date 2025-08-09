// credentials.dart
import 'dart:convert';
import 'package:unimar_sab_19/valueObject/password.dart';

class LoginPetAdoptResponse {
  final String? message;
  final String? token;
  final String? userId;
  final String? isAdmin;

  const LoginPetAdoptResponse({
    required this.message,
    required this.token,
    required this.userId,
    required this.isAdmin,
  });

  factory LoginPetAdoptResponse.fromJson(Map<String, dynamic> json) {
    return LoginPetAdoptResponse(
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      userId: json['userId'] ?? '',
      isAdmin: json['isAdmin']?.toString() ?? 'false',
    );
  }
  String toJsonString() {
    final data = {
      'message': message,
      'token': token,
      'userId': userId,
      'isAdmin': isAdmin,
    };

    return jsonEncode(data);
  }
}
