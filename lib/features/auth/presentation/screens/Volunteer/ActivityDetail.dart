import 'package:flutter/material.dart';

import 'ActivitiesCompletion.dart';

class ActivityDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chocolatada colegio 1027'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen de la actividad
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/chocolatada.jpg', height: 200, // Reemplaza con tu URL de imagen
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Nivel de dificultad
            Row(
              children: [
                Text('Nivel de dificultad', style: TextStyle(fontSize: 16)),
                Spacer(),
                Icon(Icons.star, color: Colors.blue),
                Text('5', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 8),
            // Número de inscritos
            Row(
              children: [
                Text('Personas ya inscritas', style: TextStyle(fontSize: 16)),
                Spacer(),
                Text('50', style: TextStyle(fontSize: 16, color: Colors.blue)),
              ],
            ),
            SizedBox(height: 16),
            // Descripción
            Text('Descripción', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Personal Mínimo: 20 voluntarios'),
            Text('Personal Máximo: 30 voluntarios'),
            Text('Fechas: 05/07/2024 - 10/07/2024'),
            Text('Lugar: Colegio 1027 SMP'),
            SizedBox(height: 32),
            // Botón de inscripción
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navegamos a la pantalla de ActivityCompletion
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ActivityCompletion())
                  );// Lógica para inscribirse
                },
                child: Text('Ver en detalle'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}