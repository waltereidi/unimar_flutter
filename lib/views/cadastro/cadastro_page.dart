import 'package:flutter/material.dart';
import 'package:unimar_sab_19/views/login/utils/functions.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  bool _obscureText = true;

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
                Text("Email"),
                TextField(
                  decoration: inputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    hintText: "Digite seu email",
                  ),
                ),
                Text("Senha"),
                TextField(
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
              ],
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
    );
  }
}
