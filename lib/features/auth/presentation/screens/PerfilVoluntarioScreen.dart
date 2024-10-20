import 'package:flutter/material.dart';
import '../../data/repositories/AuthRepository.dart';
import '../../data/models/PerfilVoluntarioModel.dart';

class PerfilVoluntarioScreen extends StatefulWidget {
  final int usuarioId;

  PerfilVoluntarioScreen({required this.usuarioId});

  @override
  _PerfilVoluntarioScreenState createState() => _PerfilVoluntarioScreenState();
}

class _PerfilVoluntarioScreenState extends State<PerfilVoluntarioScreen> {
  late Future<PerfilVoluntarioModel> _perfilFuture;

  @override
  void initState() {
    super.initState();
    _perfilFuture = _getPerfilVoluntario();
  }

  Future<PerfilVoluntarioModel> _getPerfilVoluntario() async {
    AuthRepository authRepository = AuthRepository();
    final perfilData = await authRepository.getVoluntarioData(widget.usuarioId);
    return PerfilVoluntarioModel.fromJson(perfilData);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PerfilVoluntarioModel>(
      future: _perfilFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error al cargar los datos'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No se encontraron datos del perfil'));
        }

        final perfil = snapshot.data!;

        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Imagen de perfil
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                    child: Icon(Icons.person, size: 60, color: Color(0xFFFF6A00))
                ),
                SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {
                    // Acción para modificar la foto
                  },
                  icon: Icon(Icons.edit, color: Color(0xFFFF6A00)),
                  label: Text('Modificar foto', style: TextStyle(color: Color(0xFFFF6A00))),
                ),
                SizedBox(height: 20),

                // Datos personales
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Datos personales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Divider(color: Colors.grey),
                        SizedBox(height: 10),
                        // Nombre
                        _buildPersonalInfoRow(Icons.person, 'Nombre', perfil.nombre),
                        SizedBox(height: 10),
                        // Apellido
                        _buildPersonalInfoRow(Icons.person_outline, 'Apellido', perfil.apellido),
                        SizedBox(height: 10),
                        // Correo
                        _buildPersonalInfoRow(Icons.email, 'Correo', perfil.correo),
                        SizedBox(height: 10),
                        // Teléfono
                        _buildPersonalInfoRow(Icons.phone, 'Teléfono', perfil.telefono),
                        SizedBox(height: 10),
                        // Intereses
                        _buildPersonalInfoRow(Icons.interests, 'Intereses', perfil.intereses),
                        SizedBox(height: 10),
                        // Experiencia
                        _buildPersonalInfoRow(Icons.work_outline, 'Experiencia', perfil.experiencia),
                        SizedBox(height: 10),
                        // Disponibilidad
                        _buildPersonalInfoRow(Icons.access_time, 'Disponibilidad', perfil.disponibilidad),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Plan actual
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Plan Actual', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Divider(color: Colors.grey),
                        SizedBox(height: 10),
                        Text('Plan: Básico', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            // Acción para cambiar el plan
                          },
                          child: Text('Cambiar Plan', style: TextStyle(color: Color(0xFFFF6A00))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPersonalInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFFFF6A00)),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            '$label: $value',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
