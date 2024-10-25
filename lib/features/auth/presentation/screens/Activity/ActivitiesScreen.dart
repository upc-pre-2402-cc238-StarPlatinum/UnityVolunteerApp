import 'package:flutter/material.dart';
import '../../../data/models/ActivityModel.dart';
import 'Event/EventDetailScreen.dart';
 // Importamos la pantalla de detalles del evento

class ActivitiesScreen extends StatelessWidget {
  final List<ActivityModel> actividades;

  ActivitiesScreen({required this.actividades});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actividades Publicadas'),
        backgroundColor: Color(0xFF3894B6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: actividades.length,
          itemBuilder: (context, index) {
            final actividad = actividades[index];
            return GestureDetector(
              onTap: () {
                // Navegar a la pantalla de detalles del evento
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailScreen(evento: actividad),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      actividad.imagenUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            actividad.nombre,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(actividad.descripcion),
                          SizedBox(height: 10),
                          Text('Tipo: ${actividad.tipoActividad}'),
                          Text('Duración: ${actividad.duracionDias} días'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
