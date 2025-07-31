class CadastroPetAdoptResponse {
  final String message;
  final String token;
  final String userId;
  final bool isAdmin;

  CadastroPetAdoptResponse({
    required this.message,
    required this.token,
    required this.userId,
    required this.isAdmin,
  });

  // Factory para criar a partir de JSON
  factory CadastroPetAdoptResponse.fromJson(Map<String, dynamic> json) {
    return CadastroPetAdoptResponse(
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      userId: json['userId'] ?? '',
      isAdmin: json['isAdmin'] ?? false,
    );
  }

  // Converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'userId': userId,
      'isAdmin': isAdmin,
    };
  }

  @override
  String toString() {
    return 'CadastroPetAdoptResponse(message: $message, userId: $userId, isAdmin: $isAdmin)';
  }
}
