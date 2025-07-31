class CadastroPetAdoptRequest {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;

  CadastroPetAdoptRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  // Construtor a partir de JSON
  factory CadastroPetAdoptRequest.fromJson(Map<String, dynamic> json) {
    return CadastroPetAdoptRequest(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmpassword'] ?? '',
    );
  }

  // Converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'confirmpassword': confirmPassword,
    };
  }

  // Override toString para debug
  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone: $phone)';
  }
}
