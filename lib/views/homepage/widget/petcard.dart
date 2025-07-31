import 'package:flutter/material.dart';
import 'package:unimar_sab_19/constants.dart';
import 'package:unimar_sab_19/models/petmodel.dart';

class PetCard extends StatelessWidget {
  const PetCard({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(66, 18, 18, 18),
            blurRadius: 5.0,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Image.network(
                pet.images[0],
                fit: BoxFit.cover,
                height: 150.0,
                width: double.infinity,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      pet.name,
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      ' (${pet.age} years)',
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
                Text(
                  pet.breed ?? 'Unknown Breed',
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.location_on, color: Colors.black),
                    Text(
                      pet.category ?? 'Unknown Category',
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
