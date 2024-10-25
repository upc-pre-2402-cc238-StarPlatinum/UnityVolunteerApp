import 'package:flutter/material.dart';
import '../../../data/models/VoluntarioModel.dart';
 // Asegúrate de importar el modelo

class ScreenListaVoluntarios extends StatelessWidget {
  final List<VoluntarioModel> voluntariosSimulados;

  ScreenListaVoluntarios({required this.voluntariosSimulados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Voluntarios'),
        backgroundColor: Color(0xFF3894B6),
      ),
      body: _verVoluntariosScreen(),
    );
  }

  // Función para mostrar la lista de voluntarios
  Widget _verVoluntariosScreen() {
    if (voluntariosSimulados.isEmpty) {
      return Center(
        child: Text('No hay voluntarios disponibles'),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: voluntariosSimulados.length,
          itemBuilder: (context, index) {
            final voluntario = voluntariosSimulados[index];
            return Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('ID: ${voluntario.usuarioId}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Intereses: ${voluntario.intereses}'),
                    Text('Experiencia: ${voluntario.experiencia}'),
                    Text('Disponibilidad: ${voluntario.disponibilidad}'),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
