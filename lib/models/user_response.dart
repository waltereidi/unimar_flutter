class UserResponse {
  final String gender;
  // final String city;
  final String email;
  final String phone;

  UserResponse({
    required this.gender,
    // required this.city,
    required this.email,
    required this.phone,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      gender: json['gender'],
      //city: json['city'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
