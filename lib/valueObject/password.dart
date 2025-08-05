import 'package:equatable/equatable.dart';

class Password extends Equatable {
  final String value;

  /// Construtor privado
  const Password._(this.value);

  /// Fábrica com validação
  factory Password(String input) {
    if (!Password.isValidPassword(input)) {
      throw ArgumentError('A senha deve ter no mínimo 8 caracteres');
    }
    return Password._(input);
  }

  static bool isValidPassword(String password) {
    return password.trim().length >= 8;
  }

  @override
  List<Object?> get props => [value];
}
