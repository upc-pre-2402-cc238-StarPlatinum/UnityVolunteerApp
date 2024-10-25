import 'package:flutter/material.dart';
import '../../../data/models/ActivityModel.dart';// Importamos el modelo

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
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen de la actividad
                  Image.network(
                    actividad.imagenUrl,  // URL temporal, aquí podrías cargar una imagen real
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nombre de la actividad
                        Text(
                          actividad.nombre,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        // Descripción de la actividad
                        Text(
                          actividad.descripcion,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        // Tipo de actividad
                        Text(
                          'Tipo: ${actividad.tipoActividad}',
                          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                        SizedBox(height: 10),
                        // Duración de la actividad
                        Text(
                          'Duración: ${actividad.duracionDias} días',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
