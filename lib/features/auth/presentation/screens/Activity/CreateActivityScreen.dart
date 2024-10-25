import 'package:flutter/material.dart';

class CreateActivityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // in columns widgets, it gets strech horizontally, the oposite happers when in rows
          children:[
            Text(
              'Formulario de actividad',
              style:TextStyle(fontSize:24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center
            ),
            SizedBox(height:20),
            TextField(
                decoration:InputDecoration(
                   labelText:'¿Cual es el nombre de la Actividad?',
                  border: UnderlineInputBorder(borderSide: BorderSide(width: 2.0))
                )
            ),
            SizedBox(height: 20),
            TextField(
              decoration:InputDecoration(
                labelText:'Descripción',
                border: UnderlineInputBorder(borderSide: BorderSide(width: 2.0)),
                hintText: 'Cuentanos más acerca de tu actividad...'
              ),
              maxLines:4
            ),
            SizedBox(height: 20),
            TextField(
                decoration:InputDecoration(
                    labelText:'Tipo de actividad',
                    border: UnderlineInputBorder(borderSide: BorderSide(width: 2.0)),
                    hintText: '¿Cual es el tipo de actividad?'
                ),
                maxLines:4
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,

                decoration:InputDecoration(
                    labelText:'¿Cuantos días durará esta actividad?',
                    border: UnderlineInputBorder(borderSide: BorderSide(width: 2.0)),
                    hintText: '0'
                ),
                maxLines:4
            ),
            SizedBox(height: 20),

            ElevatedButton(
                onPressed: () {
                  /* TODO: Implement logic for handling onTap (should create the activity*/
                },
                child: Text('Crear actividad'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3894B6),
              )
            ),


          ],
        )
      ),)
    );
  }


}