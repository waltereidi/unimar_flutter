import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 222, 173, 173),
        border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(20.0),
      height: 200.0,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            //Evita que o Row ocupe todo o espaço disponível
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home, size: 50.0),
              Text("Samuel Santos", style: TextStyle(fontSize: 30)),
            ],
          ),
          Text("Desenvolvedor Mobile Flutter", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
