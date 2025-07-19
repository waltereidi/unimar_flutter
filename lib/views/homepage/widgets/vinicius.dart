import 'package:flutter/material.dart';

class Vinicius extends StatelessWidget {
  const Vinicius({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Image.network(
            'https://www.svicente.com.br/on/demandware.static/-/Sites-storefront-catalog-sv/default/dwc30e3425/Produtos/1021486-5000299628768-whisky%20ballantines%2010%20anos%201l-ballantines-4.jpg',
            width: 120,
            height: 120,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                const Text(
                  'Lorem ipsum',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 123, 255),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  child: Container(
                    width: 80,
                    child: Row(children: [
                      Icon(Icons.add_shopping_cart, size: 18),
                      const Text('Adicionar')
                    ],)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

