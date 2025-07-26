import 'package:flutter/material.dart';
import 'package:unimar_sab_19/models/user_response.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.userApp});
  final UserResponse userApp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 222, 173, 173),
        border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(20.0),
      //height: 200.0,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            //Evita que o Row ocupe todo o espaço disponível
            mainAxisSize: MainAxisSize.min,
            spacing:
                20, //Espaçamento entre os elementos do Row - Versoes mais recentes do Flutter usam `spacing` em vez de `mainAxisAlignment`
            children: [
              Image.asset('assets/images/0.jpg', width: 100, height: 100),

              Text(userApp.gender , style: TextStyle(fontSize: 30)),
            ],
          ), //
          Text(userApp.gender , style: TextStyle(fontSize: 20)),
          Text(userApp.email , style: TextStyle(fontSize: 14)),
          //Image.network(userApp.imageUrl ?? '', width: 50, height: 50),
        ],
      ),
    );
  }
}
