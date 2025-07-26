import 'package:flutter/material.dart';
import 'package:unimar_sab_19/views/config/config_page.dart';
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
    ConfigPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Adoption'),
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
        backgroundColor: Color(0xFFFF87AB),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}
