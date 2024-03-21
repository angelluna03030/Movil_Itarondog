import 'package:flutter/material.dart';
class BottonesNavegacionPages extends StatefulWidget {
  const BottonesNavegacionPages({super.key});
  @override
  State<BottonesNavegacionPages> createState() => _BottonesNavegacionState();
}
class _BottonesNavegacionState extends State<BottonesNavegacionPages> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
       Navigator.pushNamed(context, "/");
        break;
      case 1:
        Navigator.pushNamed(context, "CarritoCompras"); // Asegúrate de que esta ruta está definida en tu MaterialApp
        break;
      case 2:
      Navigator.pushNamed(context, "InformacionPersonar"); // Y esta también
        break;
    }
  }
 @override
Widget build(BuildContext context) {
  return BottomNavigationBar(
    backgroundColor: Color(0xffe44333), // Color de fondo de la barra
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 30.0),
        label: '', // Etiqueta vacía para este ítem
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart, size: 30.0),
        label: '', // Etiqueta vacía para este ítem
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person, size: 30.0),
        label: '', // Etiqueta vacía para este ítem
      ),
    ],
    selectedItemColor: Colors.white, // Color para ítem seleccionado
    unselectedItemColor: Colors.white, // Color para ítems no seleccionados, igual al de ítem seleccionado
    onTap: _onItemTapped,
  );
}

}
