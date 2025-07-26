import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimar_sab_19/providers/favorites_provider.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = context.watch<FavoritesProvider>();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 191, 207),
      body: ListView.builder(
        itemCount: favoritesProvider.favoritesPet.length,
        itemBuilder: (context, index) {
          if (favoritesProvider.favoritesPet.isEmpty) {
            return Center(
              child: Text(
                'Nenhum pet favorito encontrado',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
            );
          }

          final pet = favoritesProvider.favoritesPet[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(pet.images[0])),
            title: Text(pet.name),
            subtitle: Text('${pet.age} anos'),
            trailing: IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                favoritesProvider.removeFavoritePet(pet);
              },
            ),
          );
        },
      ),
    );
  }
}
