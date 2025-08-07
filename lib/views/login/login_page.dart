import 'package:flutter/material.dart';
import 'package:unimar_sab_19/approutes.dart';
import 'package:unimar_sab_19/services/localStorageService.dart';

import 'package:unimar_sab_19/views/login/utils/functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  final _controllerEmail = TextEditingController.fromValue(
    TextEditingValue(text: ""),
  );
  final _controllerSenha = TextEditingController.fromValue(
    TextEditingValue(text: ""),
  );

  @override
  void initState() {
    super.initState();

    // You can add any initialization logic here if needed
  }

  void _changeObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 228, 235, 238),
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
                  "Login",
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
                Text("Email"),
                TextField(
                  decoration: inputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    hintText: "Digite seu email",
                  ),
                  controller: _controllerEmail,
                ),
                Text("Senha"),
                TextField(
                  controller: _controllerSenha,
                  obscureText: _obscureText, // This hides the password input
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
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text("Esqueceu sua senha?")],
                  ),
                ),
              ],
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  var storage = LocalStorageService();
                  var user = await storage.loadData('user');
                  var password = await storage.loadData('password');
                  var token = await storage.loadData('token');
                  print(token);

                  if (user == _controllerEmail.text &&
                      password == _controllerSenha.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login realizado com sucesso!')),
                    );
                    Navigator.pushReplacementNamed(context, Approutes.home);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login ou senha inválidos!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF87AB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Text("OU"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/google.png", width: 30, height: 30),
                Image.asset(
                  "assets/images/facebook.png",
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Não tem uma conta?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Approutes.cadastro);
                  },
                  child: Text("Cadastre-se"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
