import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;

class InsertarDatosPage extends StatefulWidget {
  @override
  _InsertarDatosPageState createState() => _InsertarDatosPageState();
}

class _InsertarDatosPageState extends State<InsertarDatosPage> {
  Future<void> cargarDatosDesdeJson() async {
    try {
      // Leer el archivo JSON
      String jsonString =
          await rootBundle.loadString('assets/datosBBDD/quizz_historia.json');
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      // Extraer las preguntas
      Map<String, dynamic> documentos = jsonMap['quizz_historia']['documentos'];
      List<Map<String, dynamic>> preguntas =
          documentos.values.toList().cast<Map<String, dynamic>>();

      // Referencia a la colección
      CollectionReference quizzHistoria =
          FirebaseFirestore.instance.collection('quizz_historia');

      // Iterar sobre las preguntas y agregarlas a Firestore
      for (var pregunta in preguntas) {
        await quizzHistoria.add(pregunta);
      }
      print('Datos cargados correctamente');
    } catch (e) {
      print('Error al cargar datos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insertar Datos en Firestore'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await cargarDatosDesdeJson();
          },
          child: Text('Cargar Datos en Firestore'),
        ),
      ),
    );
  }
}
