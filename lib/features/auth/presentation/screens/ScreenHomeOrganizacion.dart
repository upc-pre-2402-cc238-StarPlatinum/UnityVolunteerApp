import 'package:app/features/auth/presentation/screens/Activity/CreateActivityScreen.dart';
import 'package:flutter/material.dart';
import '../../data/models/ActivityModel.dart';
import '../../data/models/VoluntarioModel.dart';
import 'Activity/ActivitiesScreen.dart';
import 'Activity/ScreenListaVoluntarios.dart';
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


  // *********** INICIO DE DATOS SIMULADOS ***********
  List<ActivityModel> actividadesSimuladas = [
    ActivityModel(
      nombre: 'Actividad de Reciclaje',
      descripcion: 'Una actividad para fomentar el reciclaje en la comunidad.',
      tipoActividad: 'Medio Ambiente',
      duracionDias: 2,
      imagenUrl: 'assets/images/reciclaje.jpeg',  // URL de la imagen
    ),
    ActivityModel(
      nombre: 'Maratón Solidario',
      descripcion: 'Un evento para recaudar fondos para obras sociales.',
      tipoActividad: 'Deportivo',
      duracionDias: 1,
      imagenUrl: 'assets/images/maraton.jpeg',  // URL de la imagen
    ),
    ActivityModel(
      nombre: 'Taller de Educación Digital',
      descripcion: 'Capacitación para el uso de herramientas digitales en educación.',
      tipoActividad: 'Educación',
      duracionDias: 3,
      imagenUrl: 'assets/images/taller.jpg',  // URL de la imagen
    ),
  ];

  // *********** FIN DE DATOS SIMULADOS ***********

  // Lista de voluntarios simulados
  List<VoluntarioModel> voluntariosSimulados = [
    VoluntarioModel(
      usuarioId: 1,
      nombre: 'Eduardo Guerra',
      intereses: 'Educación, Tecnología',
      experiencia: '2 años en educación infantil',
      disponibilidad: 'Fines de semana',
    ),
    VoluntarioModel(
      usuarioId: 2,
      nombre: 'Samir Rojas',
      intereses: 'Salud, Bienestar',
      experiencia: '3 años como paramédico',
      disponibilidad: 'Lunes a viernes',
    ),
    VoluntarioModel(
      usuarioId: 3,
      nombre: 'Mateo Aldano',
      intereses: 'Medio ambiente, Energías renovables',
      experiencia: '1 año en proyectos de sostenibilidad',
      disponibilidad: 'Tiempo completo',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _Screens = [
      _inicioScreen(),
      CreateActivityScreen(),
      ScreenListaVoluntarios(voluntariosSimulados: voluntariosSimulados),
      ActivitiesScreen(actividades: actividadesSimuladas),
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
