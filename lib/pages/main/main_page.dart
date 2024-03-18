import 'package:cardapio/pages/home/home_page.dart';
import 'package:cardapio/pages/profile/profile_page.dart';
import 'package:cardapio/pages/admin/admin_page.dart';
import 'package:flutter/material.dart';
 
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('main'),),

      body: [
        HomePage(),
        AdminPage(),
        ProfilePage()
      ][_selectedIndex],

      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
          
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Administração'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil de Usuário'),
        ]),

    );
  }
}

