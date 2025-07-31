import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimar_sab_19/providers/favorites_provider.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 191, 207),
     
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          if (favoritesProvider.favoritesPet.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Nenhum pet favorito ainda',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Adicione pets aos favoritos na página inicial',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: favoritesProvider.favoritesPet.length,
            itemBuilder: (context, index) {
              final pet = favoritesProvider.favoritesPet[index];
              return Card(
                margin: EdgeInsets.only(bottom: 12),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      pet.images.isNotEmpty ? pet.images[0] : '',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[300],
                          child: Icon(Icons.pets, color: Colors.grey[600]),
                        );
                      },
                    ),
                  ),
                  title: Text(
                    pet.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    '${pet.age} anos • ${pet.breed ?? 'Raça não informada'}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 28,
                    ),
                    onPressed: () {
                      favoritesProvider.removeFavoritePet(pet);
                    },
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detalhes',
                      arguments: pet,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
