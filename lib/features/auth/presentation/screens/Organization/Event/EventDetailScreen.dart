import 'package:flutter/material.dart';
import '../../../../data/models/ActivityModel.dart';
import '../../../../data/models/VoluntarioModel.dart'; // Importamos el modelo de voluntarios

class EventDetailScreen extends StatefulWidget {
  final ActivityModel evento;

  EventDetailScreen({required this.evento});

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  bool _mostrarListaVoluntarios = false;
  bool _mostrarDetallesVoluntarios = false;

  // Simulamos algunos voluntarios
  List<VoluntarioModel> voluntariosSimulados = [
    VoluntarioModel(
      usuarioId: 1,
      nombre: 'Santiago Olivera',
      intereses: 'Educación, Tecnología',
      experiencia: '2 años en educación infantil',
      disponibilidad: 'Fines de semana',
    ),
    VoluntarioModel(
      usuarioId: 2,
      nombre: 'David Fantasmon',
      intereses: 'Salud, Bienestar',
      experiencia: '3 años como paramédico',
      disponibilidad: 'Lunes a viernes',
    ),
    VoluntarioModel(
      usuarioId: 3,
      nombre: 'Nicolas Cortez',
      intereses: 'Medio ambiente, Energías renovables',
      experiencia: '1 año en proyectos de sostenibilidad',
      disponibilidad: 'Tiempo completo',
    ),
  ];
  // Simulamos algunos voluntarios
  List<VoluntarioModel> voluntariosSimulados2 = [
    VoluntarioModel(
      usuarioId: 1,
      nombre: 'Geyko Rober',
      intereses: 'Educación, Tecnología',
      experiencia: '2 años en educación infantil',
      disponibilidad: 'Fines de semana',
    ),
    VoluntarioModel(
      usuarioId: 2,
      nombre: 'Leonardo Soto',
      intereses: 'Salud, Bienestar',
      experiencia: '3 años como paramédico',
      disponibilidad: 'Lunes a viernes',
    ),
    VoluntarioModel(
      usuarioId: 3,
      nombre: 'Rodrigo Oficial',
      intereses: 'Medio ambiente, Energías renovables',
      experiencia: '1 año en proyectos de sostenibilidad',
      disponibilidad: 'Tiempo completo',
    ),
  ];

  // Función para alternar la visibilidad de la lista de nombres de voluntarios
  void _toggleListaVoluntarios() {
    setState(() {
      _mostrarListaVoluntarios = !_mostrarListaVoluntarios;
    });
  }

  // Función para alternar la visibilidad de la lista detallada de voluntarios
  void _toggleDetallesVoluntarios() {
    setState(() {
      _mostrarDetallesVoluntarios = !_mostrarDetallesVoluntarios;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Evento'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresar a la vista de las tarjetas
          },
        ),
        backgroundColor: Color(0xFF3894B6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.evento.imagenUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              // Mostramos los detalles del evento
              Text(
                widget.evento.nombre,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(widget.evento.descripcion),
              SizedBox(height: 10),
              Text('Tipo: ${widget.evento.tipoActividad}'),
              Text('Duración: ${widget.evento.duracionDias} días'),
              SizedBox(height: 20),

              // Botón para mostrar la lista de nombres de voluntarios
              ElevatedButton(
                onPressed: _toggleListaVoluntarios,
                child: Text(_mostrarListaVoluntarios
                    ? 'Ocultar Voluntarios Inscritos'
                    : 'Mostrar Nombres de Voluntarios'),
              ),

              // Mostrar la lista de nombres de voluntarios (si está activado)
              if (_mostrarListaVoluntarios)
                _buildListaVoluntarios(),

              SizedBox(height: 20),

              // Botón para mostrar la lista con detalles de voluntarios
              ElevatedButton(
                onPressed: _toggleDetallesVoluntarios,
                child: Text(_mostrarDetallesVoluntarios
                    ? 'Ocultar Otros Voluntarios'
                    : 'Mostrar Otros Voluntarios'),
              ),

              // Mostrar la lista de voluntarios con más detalles (si está activado)
              if (_mostrarDetallesVoluntarios)
                _buildDetallesVoluntarios(),
            ],
          ),
        ),
      ),
    );
  }

  // Construimos la lista de nombres de voluntarios
  Widget _buildListaVoluntarios() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Nombre')),
      ],
      rows: voluntariosSimulados2
          .map((voluntario) => DataRow(cells: [
        DataCell(Text(voluntario.nombre)),
      ]))
          .toList(),
    );
  }

  // Construimos la lista de voluntarios con detalles adicionales
  Widget _buildDetallesVoluntarios() {
    return DataTable(
      columns: [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Intereses')),
        DataColumn(label: Text('Experiencia')),
        DataColumn(label: Text('Disponibilidad')),
      ],
      rows: voluntariosSimulados
          .map((voluntario) => DataRow(cells: [
        DataCell(Text('US ${voluntario.usuarioId}')),
        DataCell(Text(voluntario.nombre)),
        DataCell(Text(voluntario.intereses)),
        DataCell(Text(voluntario.experiencia)),
        DataCell(Text(voluntario.disponibilidad)),
      ]))
          .toList(),
    );
  }
}
