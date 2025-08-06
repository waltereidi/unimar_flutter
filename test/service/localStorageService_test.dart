import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unimar_sab_19/services/localStorageService.dart';

void main() {
  group('LocalStorageService', () {
    late LocalStorageService storage;

    setUp(() {
      SharedPreferences.setMockInitialValues(
        {},
      ); // limpa o armazenamento antes de cada teste
      storage = LocalStorageService();
    });

    test('salva e recupera o nome de usuário', () async {
      await storage.saveData('token', 'Walter');
      final username = await storage.loadData('token');
      await storage.saveData('token', 'Walter2');
      final username2 = await storage.loadData('token');

      expect(username, 'Walter');
      expect(username2, 'Walter2');
    });
  });
}
