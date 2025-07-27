import 'package:flutter/material.dart';
import 'package:unimar_sab_19/approutes.dart';
import 'package:unimar_sab_19/constants.dart';
import 'package:unimar_sab_19/views/favoritos/favoritos_page.dart';
import 'package:unimar_sab_19/views/homepage/homepage.dart';
import 'package:unimar_sab_19/views/profile/perfil_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  //Qual a lógcica para navegar entre as páginas?
  //Modificar o estado do índice selecionado

  final List<Widget> _pages = [
    Homepage(),
    FavoritosPage(),
    PerfilPage(),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Adoption'),
        leading: const Icon(Icons.pets),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, Approutes.configuracoes);
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
        backgroundColor: Color(0xFFFF87AB),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: appPinkColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 53, 52, 52),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
         
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}
