import 'package:flutter/material.dart';
import 'package:unimar_sab_19/mocks/list_users.dart';
import 'package:unimar_sab_19/views/homepage/widgets/appcard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: const Color.fromARGB(255, 84, 164, 225),
        child: ListView.builder(
          itemCount: mockUsers.length,
          itemBuilder: (context, index) {
            final user = mockUsers[index];
            return AppCard(userApp: user);
          },
        ),
      ),
    );
  }
}
