import 'package:equatable/equatable.dart';

class EmailAddress extends Equatable {
  final String value;

  /// Construtor privado
  const EmailAddress._(this.value);

  /// Fábrica com validação
  factory EmailAddress(String input) {
    if (!_isValidEmail(input)) {
      throw FormatException("Email inválido: $input");
    }
    return EmailAddress._(input);
  }

  static bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r"""^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$""",
    );
    return emailRegex.hasMatch(email);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => value;
}
