import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimar_sab_19/constants.dart';
import 'package:unimar_sab_19/controllers/petsdata_controller.dart';
import 'package:unimar_sab_19/models/petmodel.dart';
import 'package:unimar_sab_19/providers/favorites_provider.dart';
import 'package:unimar_sab_19/views/homepage/widget/petcard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Pets?>(
        future: PetsdataController().getAllPets(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (asyncSnapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Erro ao carregar pets: ${asyncSnapshot.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Força a reconstrução do widget para tentar novamente
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Homepage()),
                      );
                    },
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }
          
          // Verificar se o retorno é nulo (pode acontecer em caso de erro de conexão)
          if (asyncSnapshot.data == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off, size: 48, color: Colors.orange),
                  const SizedBox(height: 16),
                  const Text(
                    'Erro de conexão',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Não foi possível conectar ao servidor. Verifique sua conexão com a internet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Força a reconstrução do widget para tentar novamente
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Homepage()),
                      );
                    },
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }

          final pets = asyncSnapshot.data?.pets ?? [];
          if (pets.isEmpty) {
            return const Center(child: Text('Nenhum pet encontrado'));
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            padding: const EdgeInsets.all(10),
            itemCount: pets.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  GestureDetector(
                    child: PetCard(pet: pets[index]),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detalhes',
                        arguments: pets[index],
                      );
                    },
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Consumer<FavoritesProvider>(
                      builder: (context, favoritesProvider, child) {
                        final isFavorite = favoritesProvider.isFavorite(
                          pets[index],
                        );
                        return IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            size: 30,
                            color: isFavorite ? Colors.red : appPinkColor,
                          ),
                          onPressed: () {
                            favoritesProvider.toggleFavorite(pets[index]);
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),

      // Botão de adicionar no canto inferior direito
      floatingActionButton: FloatingActionButton(
        backgroundColor: appPinkColor,
        child: const Icon(Icons.add, size: 28),
        onPressed: () {
          Navigator.pushNamed(context, '/adicionarPet');
        },
      ),
    );
  }
}
