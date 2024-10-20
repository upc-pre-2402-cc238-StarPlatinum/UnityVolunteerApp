import 'package:flutter/material.dart';
import '../../data/repositories/AuthRepository.dart';
import 'LoginScreen.dart';  // Importar la página de Login

class VoluntarioScreen extends StatefulWidget {
  final String nombre;
  final int usuarioId;  // ID del usuario registrado

  VoluntarioScreen({required this.nombre, required this.usuarioId});

  @override
  _VoluntarioScreenState createState() => _VoluntarioScreenState();
}

class _VoluntarioScreenState extends State<VoluntarioScreen> {
  final _interesesController = TextEditingController();
  final _experienciaController = TextEditingController();
  final _disponibilidadController = TextEditingController();
  final AuthRepository _authRepository = AuthRepository();

  Future<void> _guardarDatosVoluntario() async {
    try {
      // Guardar datos del voluntario
      await _authRepository.saveVoluntarioData(
        widget.usuarioId,
        _interesesController.text,
        _experienciaController.text,
        _disponibilidadController.text,
      );

      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Datos guardados exitosamente')),
      );

      // Redirigir al login después de guardar los datos
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar datos: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(  // Agregar Scroll para evitar problemas de overflow
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 50),  // Añadir más espacio en la parte superior
            // Encabezado con ícono
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.volunteer_activism,  // Ícono de voluntariado
                  size: 100,
                  color: Color(0xFFFF6A00),  // Color relacionado con voluntariado
                ),
                SizedBox(height: 20),
                Text(
                  '¡Hola, ${widget.nombre}!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Completa tu información de voluntario',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 40),

            // Campo de intereses
            _buildTextField('Intereses', _interesesController),
            SizedBox(height: 20),

            // Campo de experiencia
            _buildTextField('Experiencia', _experienciaController),
            SizedBox(height: 20),

            // Campo de disponibilidad
            _buildTextField('Disponibilidad', _disponibilidadController),
            SizedBox(height: 40),

            // Botón de guardar
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6A00),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _guardarDatosVoluntario,
              child: Text('Guardar', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  // Método reutilizable para TextFields
  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[700]),
        filled: true,
        fillColor: Color(0xFFF5F6FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
