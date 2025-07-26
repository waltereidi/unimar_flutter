import 'package:flutter/material.dart';
import 'package:unimar_sab_19/controllers/petsdata_controller.dart';
import 'package:unimar_sab_19/models/petmodel.dart';
import 'package:unimar_sab_19/views/homepage/widget/petcard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Pets>(
        future: PetsdataController().getAllPets(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<Pet> pets = asyncSnapshot.data?.pets ?? [];
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: pets.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: PetCard(pet: pets[index]),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detalhes',
                    arguments: pets[index],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
