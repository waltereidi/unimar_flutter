import 'dart:convert';

class AdicionarPetPetAdoptRequest {
  final String nome;
  final String peso;
  final String cor;
  final int idade;

  AdicionarPetPetAdoptRequest({
    required this.nome,
    required this.peso,
    required this.cor,
    required this.idade,
  });

  String toJsonString() {
    final data = {'nome': nome, 'peso': peso, 'cor': cor, 'idade': idade};

    return jsonEncode(data);
  }
}
