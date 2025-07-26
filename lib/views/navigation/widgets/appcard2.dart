import 'package:flutter/material.dart';
import 'package:unimar_sab_19/models/user_app.dart';

class AppCard2 extends StatelessWidget {
  const AppCard2({super.key, required this.userApp});
  final UserApp userApp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 169, 170, 245),
        border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(20.0),
      child: Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Column(
                children: [
                  Image.asset('assets/images/0.jpg', width: 100, height: 100),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text(userApp.name ?? '', style: TextStyle(fontSize: 30)),
              Text(userApp.role ?? '', style: TextStyle(fontSize: 20)),
              Text(userApp.email ?? '', style: TextStyle(fontSize: 14)),
            ],
          ),

          Column(
            children: [
              Image.network(userApp.imageUrl ?? '', width: 100, height: 100),
            ],
          ),
        ],
      ),
    );
  }
}
