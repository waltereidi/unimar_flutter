import 'package:flutter/material.dart';
import 'package:unimar_sab_19/views/login/utils/functions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  decoration: inputDecoration(
                    labelText: "Senha",
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Digite sua senha",
                  ),
                ),
                GestureDetector(
                  onTap: () => print("Esqueceu sua senha?"),
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
                onPressed: () {},
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
                TextButton(onPressed: () {}, child: Text("Cadastre-se")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
