import 'package:flutter/material.dart';
import 'package:unimar_sab_19/constants.dart';
import 'package:unimar_sab_19/models/petmodel.dart';

class DetalhesPage extends StatelessWidget {
  const DetalhesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pet = ModalRoute.of(context)?.settings.arguments as Pet;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appPinkColor,
            expandedHeight: 350,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                pet.images[0],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    pet.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: appPinkColor,
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 80.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        PetCaracteristicas(
                          text: pet.breed ?? 'Desconhecida',
                          subtext: "Raça",
                        ),
                        PetCaracteristicas(
                          text: pet.age.toString(),
                          subtext: "Idade",
                        ),
                        PetCaracteristicas(text: "Saudável", subtext: "Saúde"),
                        PetCaracteristicas(text: "4Kg", subtext: "Peso"),
                      ],
                    ),
                  ),
                  Text(
                    "Rua da Prata, 123",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.place, color: appPinkColor),
                      Text(
                        pet.weight.toString(),
                        style: TextStyle(color: appPinkColor),
                      ),
                    ],
                  ),
                  Text(
                    "Minha história",
                    style: TextStyle(fontSize: 18, color: appPinkColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      pet.story ?? "Não há história disponível para este pet.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Text(
                    "Minhas Qualidades",
                    style: TextStyle(fontSize: 18, color: appPinkColor),
                  ),
                  Row(
                    children: [
                      PetCaracteristicas(text: "Boxer", subtext: "Raça"),
                      PetCaracteristicas(text: "2 anos", subtext: "Idade"),
                      PetCaracteristicas(text: "Saudável", subtext: "Saúde"),
                      PetCaracteristicas(text: "4Kg", subtext: "Peso"),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        backgroundColor: appPinkColor,
                      ),
                      child: Text(
                        "Adotar",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PetCaracteristicas extends StatelessWidget {
  const PetCaracteristicas({
    super.key,
    required this.text,
    required this.subtext,
  });

  final String text;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: appPinkColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(text, style: TextStyle(fontSize: 14, color: appPinkColor)),
          SizedBox(height: 4.0),
          Text(subtext, style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
