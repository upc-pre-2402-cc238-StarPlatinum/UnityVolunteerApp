import 'package:flutter/material.dart';
import 'PerfilVoluntarioScreen.dart';

import 'Volunteer/ActivityDetail.dart';

class ScreenHomeVoluntario extends StatefulWidget {
  final String nombre;
  final int usuarioId;

  ScreenHomeVoluntario({required this.nombre, required this.usuarioId});

  @override
  _HomeVoluntarioState createState() => _HomeVoluntarioState();
}

class _HomeVoluntarioState extends State<ScreenHomeVoluntario> {
  int _selectedIndex = 0;

  late List<Widget> _Screens;

  @override
  void initState() {
    super.initState();
    _Screens = [
      _inicioScreen(),
      Center(child: Text('Notificaciones')),
      ActivityDetail(),
      Center(child: Text('Notificaciones')),
      PerfilVoluntarioScreen(usuarioId: widget.usuarioId),
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
        title: Text('Voluntario'),
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
            icon: Icon(Icons.search),
            label: 'Actividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Programadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
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
