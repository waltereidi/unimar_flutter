import 'dart:convert';

class AdicionarPetPetAdoptRequest {
  final String name;
  final String weight;
  final String color;
  final int age;

  AdicionarPetPetAdoptRequest({
    required this.name,
    required this.weight,
    required this.color,
    required this.age,
  });

  String toJsonString() {
    final data = {'name': name, 'weight': weight, 'color': color, 'age': age};

    return jsonEncode(data);
  }
}
