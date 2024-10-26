import 'package:app/features/auth/presentation/screens/Volunteer/NotificationsScreen.dart';
import 'package:flutter/material.dart';
import '../../data/models/ActivityModel.dart';

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
  // *********** INICIO DE DATOS SIMULADOS ***********
  List<ActivityModel> actividadesSimuladas = [
    ActivityModel(
      nombre: 'Te Necesitamos!',
      descripcion: 'Unetenos a fomentar el reciclaje en la comunidad.',
      duracionDias: 2,
      imagenUrl: 'assets/images/reciclaje.jpeg',
      tipoActividad: 'Medio ambiente',  // URL de la imagen
    ),
    ActivityModel(
      nombre: 'Esta organización te está buscando!',
      descripcion: 'Escribenos a anita@organizacionbenefica.com',
      tipoActividad: 'Deportivo',
      duracionDias: 1,
      imagenUrl: 'assets/images/maraton.jpeg',  // URL de la imagen
    ),
    ActivityModel(
      nombre: 'Ayudanos a salvar el planeta',
      descripcion: 'Planta arboles con nosotros!',
      tipoActividad: 'Educación',
      duracionDias: 3,
      imagenUrl: 'assets/images/taller.jpg',  // URL de la imagen
    ),
    ActivityModel(
      nombre: 'Únetenos!!',
      descripcion: 'Unetenos a fomentar el reciclaje en la comunidad.',
      duracionDias: 2,
      imagenUrl: 'assets/images/reciclaje.jpeg',
      tipoActividad: 'Medio ambiente',  // URL de la imagen
    ),
    ActivityModel(
      nombre: 'Te queremos contactar!',
      descripcion: 'Escribenos a pepito@organizacionbenefica.com',
      tipoActividad: 'Deportivo',
      duracionDias: 1,
      imagenUrl: 'assets/images/maraton.jpeg',  // URL de la imagen
    ),
    ActivityModel(
      nombre: 'Ayudanos a salvar el planeta',
      descripcion: 'Planta arboles con nosotros!',
      tipoActividad: 'Educación',
      duracionDias: 3,
      imagenUrl: 'assets/images/taller.jpg',  // URL de la imagen
    ),
  ];

  // *********** FIN DE DATOS SIMULADOS ***********
  @override
  void initState() {
    super.initState();
    _Screens = [
      _inicioScreen(),
      Center(child: Text('Actividades')),
      ActivityDetail(),
      NotificationsScreen(notificaciones: actividadesSimuladas),
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
