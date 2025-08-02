import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:unimar_sab_19/services/httpNative.dart';

void main() {
  group('ApiService', () {
    late HttpClient httpClient;
    late HttpNative apiService;

    setUp(() {
      httpClient = HttpClient();
      apiService = HttpNative(client: httpClient);
    });

    test('deve retornar um post quando a requisição for 200', () async {
      // final mockRequest = MockHttpClientRequest();
      // final mockResponse = MockHttpClientResponse();
      // const responseBody = '{"id": 1, "title": "Post de teste"}';
      // // Configura mocks
      // when(
      //   mockClient.getUrl(
      //     Uri.parse('https://viacep.com.br/ws/17560-069/json/'),
      //   ),
      // ).thenAnswer((_) async => mockRequest);
      // when(mockRequest.close()).thenAnswer((_) async => mockResponse);
      // when(mockResponse.statusCode).thenReturn(200);
      // when(
      //   mockResponse.transform(utf8.decoder),
      // ).thenAnswer((_) => Stream.value(responseBody));

      final post = await apiService.fetchPost(
        'https://petadopt.onrender.com/user/register',
        '''{
 "name": "walter",
 "email": "walter@email.comd2d2",
 "phone":"1231231-1010",
 "password":"12345678",
 "confirmpassword":"12345678"
}''',
      );
      print("======================================");
      print(post);
    });
  });
}
