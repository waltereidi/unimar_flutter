class PetResponse {
  final String message;
  final NewPet newPet;

  PetResponse({required this.message, required this.newPet});

  factory PetResponse.fromJson(Map<String, dynamic> json) {
    return PetResponse(
      message: json['message'],
      newPet: NewPet.fromJson(json['newPet']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'newPet': newPet.toJson()};
  }
}

class NewPet {
  final String name;
  final int age;
  final num weight;
  final String color;
  final List<dynamic> images;
  final String id;
  final User user;
  final bool isVerified;
  final bool available;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  NewPet({
    required this.name,
    required this.age,
    required this.weight,
    required this.color,
    required this.images,
    required this.id,
    required this.user,
    required this.isVerified,
    required this.available,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory NewPet.fromJson(Map<String, dynamic> json) {
    return NewPet(
      name: json['name'],
      age: json['age'],
      weight: json['weight'],
      color: json['color'],
      images: List<dynamic>.from(json['images']),
      id: json['_id'],
      user: User.fromJson(json['User']),
      isVerified: json['isVerified'],
      available: json['available'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'color': color,
      'images': images,
      '_id': id,
      'User': user.toJson(),
      'isVerified': isVerified,
      'available': available,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final bool isAdmin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      isAdmin: json['isAdmin'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'isAdmin': isAdmin,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
