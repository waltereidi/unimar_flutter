import 'package:flutter/material.dart';
import 'package:unimar_sab_19/controllers/userdata_controller.dart';
import 'package:unimar_sab_19/mocks/list_users.dart';
import 'package:unimar_sab_19/models/user_response.dart';
import 'package:unimar_sab_19/views/homepage/widgets/appcard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        leading: const Icon(Icons.home),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings page
            },
          ),
          IconButton(icon: const Icon(Icons.search), onPressed: () async {}),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigate to notifications page
            },
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<UserResponse>>(
        future: UserdataController().fetchUserData(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (asyncSnapshot.data == null) {
            return const Center(child: Text('No data available'));
          }
          return Container(
            color: const Color.fromARGB(255, 84, 164, 225),
            child: ListView.builder(
              itemCount: asyncSnapshot.data!.length,
              itemBuilder: (context, index) {
                final user = asyncSnapshot.data![index];
                return AppCard(userApp: user);
              },
            ),
          );
        },
      ),
    );
  }
}
