import 'package:flutter/material.dart';
import 'PerfilOrganizacionScreen.dart';

class ScreenHomeOrganizacion extends StatefulWidget {
  final String nombre;
  final int usuarioId;

  ScreenHomeOrganizacion({required this.nombre, required this.usuarioId});

  @override
  _HomeOrganizacionState createState() => _HomeOrganizacionState();
}

class _HomeOrganizacionState extends State<ScreenHomeOrganizacion> {
  int _selectedIndex = 0;

  late List<Widget> _Screens;

  @override
  void initState() {
    super.initState();
    _Screens = [
      _inicioScreen(),
      Center(child: Text('Crear Actividad')),
      Center(child: Text('Ver Voluntarios')),
      Center(child: Text('Actividades Publicadas')),
      PerfilOrganizacionScreen(usuarioId: widget.usuarioId),
    ];
  }

  Widget _inicioScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Text(
            '¡Bienvenido, ${widget.nombre}!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),


        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organización'),
        backgroundColor: Color(0xFF3894B6),
      ),
      body: _Screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Crear Actividad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Voluntarios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Actividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF3894B6),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
