import 'package:unimar_sab_19/models/petmodel.dart';
import 'package:unimar_sab_19/models/user_response.dart';
import 'package:unimar_sab_19/services/http_service.dart';

class PetsdataController {
  final HttpService httpService;

  PetsdataController({HttpService? httpService})
    : httpService = httpService ?? HttpService();

  Future<List<UserResponse>> fetchUserData() async {
    final data = await httpService.getAllData('user'); //Não existe!
    
    // Verificar se houve erro na requisição
    if (data['success'] == false) {
      print('Erro ao buscar dados de usuários: ${data['error']}');
      return [];
    }
    
    final List<UserResponse> users = [];

    if (data['results'] != null) {
      data['results'].forEach((user) {
        users.add(
          UserResponse.fromJson(user),
        );
      });
    }
    return users;
  }

  Future<Pets?> getAllPets() async {
    final petsData = await httpService.getAllData('pet/pets');
    
    // Verificar se houve erro na requisição
    if (petsData['success'] == false) {
      print('Erro ao buscar dados de pets: ${petsData['error']}');
      return null;
    }
    
    try {
      Pets pets = Pets.fromJson(petsData);
      return pets;
    } catch (e) {
      print('Erro ao converter dados de pets: $e');
      return null;
    }
  }
}
