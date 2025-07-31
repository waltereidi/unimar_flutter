import 'package:flutter_test/flutter_test.dart';
import 'package:unimar_sab_19/valueObject/email.dart';

void main() {
  group('EmailAddress', () {
    test('deve criar instância válida com email correto', () {
      final email = EmailAddress('usuario@dominio.com');
      expect(email.value, 'usuario@dominio.com');
    });

    test('deve lançar FormatException com email sem @', () {
      expect(
        () => EmailAddress('usuario.dominio.com'),
        throwsA(isA<FormatException>()),
      );
    });

    test('deve lançar FormatException com email sem domínio', () {
      expect(() => EmailAddress('usuario@'), throwsA(isA<FormatException>()));
    });

    test('deve lançar FormatException com email vazio', () {
      expect(() => EmailAddress(''), throwsA(isA<FormatException>()));
    });

    test('emails iguais devem ser equivalentes (equatable)', () {
      final email1 = EmailAddress('teste@exemplo.com');
      final email2 = EmailAddress('teste@exemplo.com');
      expect(email1, equals(email2));
    });

    test('emails diferentes devem ser diferentes (equatable)', () {
      final email1 = EmailAddress('a@a.com');
      final email2 = EmailAddress('b@b.com');
      expect(email1, isNot(equals(email2)));
    });
  });
}
