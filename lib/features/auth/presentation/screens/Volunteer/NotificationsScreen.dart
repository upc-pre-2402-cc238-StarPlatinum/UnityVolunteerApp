import 'package:app/features/auth/presentation/screens/Organization/Event/EventDetailScreen.dart';
import 'package:flutter/material.dart';
import '../../../data/models/ActivityModel.dart';

 // Importamos la pantalla de detalles del evento

class NotificationsScreen extends StatelessWidget {
  final List<ActivityModel> notificaciones; //

  NotificationsScreen({required this.notificaciones});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tus Notificaciones'),
        backgroundColor: Color(0xFF3894B6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notificaciones.length,
          itemBuilder: (context, index) {
            final notificacion = notificaciones[index];
            return GestureDetector(
              onTap: () {
                // Navegar a la pantalla de detalles del evento
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailScreen(evento: notificacion),
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
                      notificacion.imagenUrl,
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
                            notificacion.nombre,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(notificacion.descripcion),
                          SizedBox(height: 10),
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
