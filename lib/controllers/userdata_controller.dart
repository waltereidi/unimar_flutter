import 'package:unimar_sab_19/models/user_response.dart';
import 'package:unimar_sab_19/services/http_service.dart';

class UserdataController {
  final HttpService httpService;

  UserdataController({HttpService? httpService})
    : httpService = httpService ?? HttpService();

  Future<List<UserResponse>> fetchUserData() async {
    final data = await httpService.getUserData();
    final List<UserResponse> users = [];

    data['results'].forEach((user) {
      users.add(
        UserResponse.fromJson(user),
      ); // Debugging line to check the fetched data
    });
    // Debugging line to check the fetched data
    return users;
  }
}
