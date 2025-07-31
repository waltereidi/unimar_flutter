class UserPetApp {
  String id;
  String name;
  String email;
  String phone;
  bool isAdmin;
  DateTime createdAt;
  DateTime updatedAt;

  UserPetApp({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserPetApp.fromJson(Map<String, dynamic> json) => UserPetApp(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    isAdmin: json["isAdmin"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "isAdmin": isAdmin,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
