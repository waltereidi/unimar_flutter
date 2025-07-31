import 'package:unimar_sab_19/models/petmodel.dart';
import 'package:unimar_sab_19/models/user_response.dart';
import 'package:unimar_sab_19/services/http_service.dart';

class PetsdataController {
  final HttpService httpService;

  PetsdataController({HttpService? httpService})
    : httpService = httpService ?? HttpService();

  Future<List<UserResponse>> fetchUserData() async {
    final data = await httpService.getAllData('user'); //Não existe!
    final List<UserResponse> users = [];

    data['results'].forEach((user) {
      users.add(
        UserResponse.fromJson(user),
      ); // Debugging line to check the fetched data
    });
    // Debugging line to check the fetched data
    return users;
  }

  Future<Pets> getAllPets() async {
    final petsData = await httpService.getAllData('pet/pets');

    Pets pets = Pets.fromJson(petsData);
    // Debugging line to check the fetched data
    return pets;
  }
}
