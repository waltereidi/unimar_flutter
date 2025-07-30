import 'package:flutter_test/flutter_test.dart';
import 'package:unimar_sab_19/valueObject/senha.dart';

void main() {
  group('Password', () {
    test('deve criar uma instância válida com 8 ou mais caracteres', () {
      final senha = Password('12345678');
      expect(senha.value, '12345678');
    });

    test('deve lançar exceção se tiver menos de 8 caracteres', () {
      expect(() => Password('1234567'), throwsA(isA<FormatException>()));
    });

    test(
      'deve aceitar espaços no meio, mas contar corretamente os caracteres',
      () {
        final senha = Password('12 345678');
        expect(senha.value, '12 345678');
      },
    );

    test('deve lançar exceção se senha tiver só espaços em branco', () {
      expect(() => Password('        '), throwsA(isA<FormatException>()));
    });

    test('senhas com mesmo valor devem ser iguais (equatable)', () {
      final senha1 = Password('abcdefgh');
      final senha2 = Password('abcdefgh');
      expect(senha1, equals(senha2));
    });

    test('senhas diferentes não devem ser iguais', () {
      final senha1 = Password('abcdefgh');
      final senha2 = Password('abcd1234');
      expect(senha1, isNot(equals(senha2)));
    });
  });
}
