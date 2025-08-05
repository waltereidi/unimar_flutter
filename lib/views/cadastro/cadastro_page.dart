import 'package:flutter/material.dart';
import 'package:unimar_sab_19/models/cadastroPetAdoptResponse.dart';
import 'package:unimar_sab_19/services/apiService.dart';
import 'package:unimar_sab_19/valueObject/emailAddress.dart';
import 'package:unimar_sab_19/valueObject/password.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  bool _obscureText = true;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  final _controllerEmail = TextEditingController.fromValue(
    TextEditingValue(text: ""),
  );
  final _controllerSenha = TextEditingController.fromValue(
    TextEditingValue(text: ""),
  );
  final _controllerConfirmPassword = TextEditingController.fromValue(
    TextEditingValue(text: ""),
  );
  final _controllerPhone = TextEditingController.fromValue(
    TextEditingValue(text: ""),
  );
  final _controllerNome = TextEditingController.fromValue(
    TextEditingValue(text: ""),
  );

  @override
  void initState() {
    super.initState();
    _controllerSenha.addListener(() {
      final text = _controllerSenha.text;
      if (text.isEmpty || Password.isValidPassword(text)) {
        setState(() {
          _passwordError = null;
        });
      } else {
        setState(() {
          _passwordError = 'A senha deve ter no mínimo 8 caracteres';
        });
      }
    });
    _controllerEmail.addListener(() {
      final text = _controllerEmail.text;
      if (text.isEmpty || EmailAddress.isValidEmail(text)) {
        setState(() {
          _emailError = null;
        });
      } else {
        setState(() {
          _emailError = 'Email inválido';
        });
      }
    });

    _controllerConfirmPassword.addListener(() {
      final text = _controllerConfirmPassword.text;

      if (text.isEmpty || Password.isValidPassword(text)) {
        setState(() {
          _confirmPasswordError = null;
        });
      } else {
        setState(() {
          _confirmPasswordError =
              'A confirmação da senha deve ter no mínimo 8 caracteres';
        });
      }
    });
  }

  void _changeObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset("assets/images/logo.png"),
                    Text(
                      "Adote Me",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF87AB),
                      ),
                    ),
                    Text(
                      "Cadastro",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF87AB),
                      ),
                    ),
                  ],
                ),

                Column(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nome"),
                    TextField(
                      controller: _controllerNome,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.assignment_ind_rounded),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFF87AB)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Digite seu nome",
                        labelText: "Nome",
                      ),
                    ),
                    Text("Telefone"),
                    TextField(
                      controller: _controllerPhone,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.contact_phone),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFF87AB)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Digite seu telefone",
                        labelText: "Telefone",
                      ),
                    ),
                    Text("Email"),
                    TextField(
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFF87AB)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Digite seu email",
                        labelText: "Email",
                        errorText: _emailError,
                      ),
                    ),
                    Text("Senha"),
                    TextField(
                      obscureText:
                          _obscureText, // This hides the password input
                      controller: _controllerSenha,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: _changeObscureText,
                          icon: _obscureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFF87AB)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Digite sua senha",
                        labelText: "Senha",
                        errorText: _passwordError,
                      ),
                    ),
                    Text("Confirmar Senha"),
                    TextField(
                      obscureText:
                          _obscureText, // This hides the password input
                      controller: _controllerConfirmPassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: _changeObscureText,
                          icon: _obscureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFF87AB)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Digite sua senha",
                        labelText: "Confirmar Senha",
                        errorText: _passwordError,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      sendCadastroRequest();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF87AB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Já tem uma conta?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendCadastroRequest() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Solicitação de cadastro enviada!')));

    var service = ApiService.getService();

    service
        .sendCadastro(
          _controllerNome.text,
          EmailAddress(_controllerEmail.text),
          _controllerPhone.text,
          Password(_controllerSenha.text),
          Password(_controllerConfirmPassword.text),
        )
        .then((response) {
          print("Response: $response");

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('enviado!')));

          var dto = CadastroPetAdoptResponse.fromJson(response);

          if (dto.token != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Cadastro realizado com sucesso!')),
            );
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Erro ao cadastrar: ${response['message']}'),
              ),
            );
          }
        })
        .catchError((error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Erro de conexão: $error')));
        });
  }
}
