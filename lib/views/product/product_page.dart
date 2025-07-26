import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Page')),
      body: Row(
        children: [
          Expanded(child: Image.asset("assets/images/image1.jpg")),
          Expanded(child: Image.asset("assets/images/image2.jpg")),
          Expanded(child: Image.asset("assets/images/image3.jpg")),
        ],
      ),
    );
  }
}
