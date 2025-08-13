import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unimar_sab_19/services/apiService.dart';

class AdicionarPetPage extends StatefulWidget {
  const AdicionarPetPage({super.key});

  @override
  State<AdicionarPetPage> createState() => _AdicionarPetPageState();
}

class _AdicionarPetPageState extends State<AdicionarPetPage> {
  final _controllerNome = TextEditingController();
  final _controllerPeso = TextEditingController();
  final _controllerCor = TextEditingController();
  final _controllerIdade = TextEditingController();

  @override
  void dispose() {
    _controllerNome.dispose();
    _controllerPeso.dispose();
    _controllerCor.dispose();
    _controllerIdade.dispose();
    super.dispose();
  }

  void sendAdicionarPetRequest() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Enviando informações do pet...')),
    );

    var service = ApiService.getService();

    var response = await service.sendAdicionarPet(
      _controllerNome.text,
      _controllerPeso.text,
      _controllerCor.text,
      int.tryParse(_controllerIdade.text) ?? 0,
    );

    if (response['message'].toString().contains("sucesso")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pet adicionado com sucesso!')),
      );
      Navigator.pop(context);
    } else if (response['error'] != null &&
        response['error'].toString().contains('conexão')) {
      // Tratamento específico para erro de conexão
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Erro de conexão: Verifique sua conexão com a internet',
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    } else {
      // Outros erros
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Erro: ${response['message'] ?? response['error'] ?? "Erro desconhecido"}',
          ),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFFF87AB)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: hint,
            labelText: label,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Cabeçalho com logo
                Column(
                  children: [
                    Image.asset("assets/images/logo.png"),
                    const Text(
                      "Adote Me",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF87AB),
                      ),
                    ),
                    const Text(
                      "Adicionar Pet",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF87AB),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Campos
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                      label: "Nome",
                      hint: "Digite o nome do pet",
                      icon: Icons.pets,
                      controller: _controllerNome,
                    ),
                    _buildTextField(
                      label: "Peso (kg)",
                      hint: "Digite o peso do pet",
                      icon: Icons.scale,
                      controller: _controllerPeso,
                      keyboardType: TextInputType.number,
                    ),
                    _buildTextField(
                      label: "Cor",
                      hint: "Digite a cor do pet",
                      icon: Icons.palette,
                      controller: _controllerCor,
                    ),
                    _buildTextField(
                      label: "Idade (anos)",
                      hint: "Digite a idade do pet",
                      icon: Icons.cake,
                      controller: _controllerIdade,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Botão Salvar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: sendAdicionarPetRequest,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF87AB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Salvar Pet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Botão cancelar
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
