import 'package:flutter/material.dart';
import 'package:quizzapp/widgets/design_quizz_ia.dart';
import 'package:quizzapp/widgets/design_quizz_vf.dart';

class SalaQuizzIaPage extends StatelessWidget {
  final String tipoQuizz;
  final int numeroPreguntas;

  const SalaQuizzIaPage({
    Key? key,
    required this.tipoQuizz,
    required this.numeroPreguntas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sala Quizz IA'),
      ),
      body: tipoQuizz == '4 respuestas'
          ? DesignQuizzIa(
              tipoQuizz: tipoQuizz,
              numeroPreguntas: numeroPreguntas,
            )
          : DesignQuizzVf(
              numeroPreguntas: numeroPreguntas,
            ),
    );
  }
}
