import 'package:flutter/material.dart';
import 'package:quizzapp/pages/sala_quizz_ia_page.dart';

class CrearQuizzIaPage extends StatefulWidget {
  const CrearQuizzIaPage({Key? key}) : super(key: key);

  @override
  _CrearQuizzIaPageState createState() => _CrearQuizzIaPageState();
}

class _CrearQuizzIaPageState extends State<CrearQuizzIaPage> {
  final _descripcionController = TextEditingController();
  String _selectedFile = 'No file selected';
  int _numeroPreguntas = 1;
  String _dificultad = 'Fácil';
  String _tipoQuizz = '4 respuestas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear QuikQuizz por IA'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Escribe aquí tu descripción de Quizz para que la IA te lo genere automáticamente, también puedes adjuntar un pdf, para que lo utilice para hacer el quizz',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descripcionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Máximo 50 palabras',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {
                    // Acción para adjuntar archivo
                  },
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Acción para enviar descripción a la IA
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<int>(
              value: _numeroPreguntas,
              onChanged: (value) {
                setState(() {
                  _numeroPreguntas = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Número de preguntas'),
              items: List.generate(10, (index) => index + 1)
                  .map((e) => DropdownMenuItem<int>(
                        value: e,
                        child: Text(e.toString()),
                      ))
                  .toList(),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _dificultad,
              onChanged: (value) {
                setState(() {
                  _dificultad = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Dificultad'),
              items: ['Fácil', 'Medio', 'Difícil']
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _tipoQuizz,
              onChanged: (value) {
                setState(() {
                  _tipoQuizz = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Tipo Quizz'),
              items: ['4 respuestas', 'Verdadero o Falso']
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para crear QuikQuizz
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalaQuizzIaPage(
                      tipoQuizz: _tipoQuizz,
                      numeroPreguntas: _numeroPreguntas,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Crear QuikQuizz'),
            ),
          ],
        ),
      ),
    );
  }
}
