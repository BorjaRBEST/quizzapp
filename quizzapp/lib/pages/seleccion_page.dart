import 'package:flutter/material.dart';
import 'package:quizzapp/pages/crear_quizz_ia_page.dart';

class SeleccionPage extends StatelessWidget {
  const SeleccionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Quizz'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CrearQuizzIaPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Crear QuikQuizz por IA'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Acción para escoger Quizz por temas
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Escoger Quizz por temas'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
