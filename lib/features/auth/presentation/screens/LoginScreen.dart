
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ScreenHomeOrganizacion.dart';
import 'ScreenHomeVoluntario.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  bool _isLoading = false;

  // Login de usuario
  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    // Aquí iría tu lógica para hacer la llamada al backend
    try {
      // Simulación del login con datos del backend
      // Si es exitoso, se redirige al usuario según el tipo de usuario.
      final String tipoUsuario = "ORGANIZACION"; // Simulación de tipo de usuario
      final int usuarioId = 1; // ID del usuario simulado
      final String nombre = "Usuario Demo"; // Nombre simulado

      // Redirigir según el tipo de usuario
      if (tipoUsuario == 'VOLUNTARIO') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenHomeVoluntario(usuarioId: usuarioId, nombre: nombre),
          ),
        );
      } else if (tipoUsuario == 'ORGANIZACION') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenHomeOrganizacion(usuarioId: usuarioId, nombre: nombre),
          ),
        );
      }
    } catch (e) {
      _showErrorDialog('Error en el inicio de sesión: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Función para mostrar un diálogo de error
  void _showErrorDialog(String mensaje) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(mensaje),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  // ******************* INICIO DEL CÓDIGO AGREGADO *******************
  // Acceso demo sin autenticación
  void _accederConDemo(tipoUsuario) {
    // Datos simulados para el usuario demo

    final int usuarioId = 123;
    final String nombre = 'Demo Org';

    if (tipoUsuario == 'VOLUNTARIO') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenHomeVoluntario(usuarioId: usuarioId, nombre: nombre),
        ),
      );
    } else if (tipoUsuario == 'ORGANIZACION') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenHomeOrganizacion(usuarioId: usuarioId, nombre: nombre),
        ),
      );
    }
  }
  // ******************* FIN DEL CÓDIGO AGREGADO *******************

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF3894B6),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Logo
            Center(
              child: Image.asset('assets/images/logo.png', height: 100),
            ),
            const SizedBox(height: 40),

            // Email TextField
            TextField(
              controller: _correoController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                filled: true,
                fillColor: Color(0xFFF5F6FA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Password TextField
            TextField(
              controller: _contrasenaController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                filled: true,
                fillColor: Color(0xFFF5F6FA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),

            // Recordarme Checkbox
            Row(
              children: [
                Checkbox(value: false, onChanged: (bool? newValue) {}),
                Text('Recordarme', style: TextStyle(color: Colors.blue)),
              ],
            ),
            SizedBox(height: 20),

            // Botón de Log In con un indicador de carga
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6A00),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _isLoading ? null : _login,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Log In', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),

            // ******************* INICIO DEL BOTÓN NUEVO *******************
            // Botón de usuario demo
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3894B6),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: ()=> _accederConDemo("ORGANIZACION"), // Acción para el usuario demo
              child: Text('Acceder como organización', style: TextStyle(color: Colors.white)),
            ),
            // ******************* FIN DEL BOTÓN NUEVO *******************

            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: ()=> _accederConDemo("VOLUNTARIO"), // Acción para el usuario demo
              child: Text('Acceder como voluntario', style: TextStyle(color: Colors.white)),
            ),
            // ******************* FIN DEL BOTÓN NUEVO *******************

            SizedBox(height: 20),
            // Recuperar contraseña y Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Acción para recuperar contraseña
                  },
                  child: Text('Recuperar contraseña', style: TextStyle(color: Colors.blue)),
                ),
                Text('|', style: TextStyle(color: Colors.blue)),
                TextButton(
                  onPressed: () {
                    // Al presionar Sign Up, navegamos a la pantalla de registro
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text('Sign Up', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

