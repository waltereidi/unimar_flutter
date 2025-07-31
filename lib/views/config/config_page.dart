import 'package:flutter/material.dart';
import 'package:unimar_sab_19/constants.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações"), backgroundColor: appPinkColor,),
      body: Center(child: Text("Conteúdo das Configurações")),
    );
  }
}
