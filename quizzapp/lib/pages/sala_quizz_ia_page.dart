import 'package:flutter/material.dart';
import 'package:quizzapp/widgets/design_quizz_ia.dart';
import 'package:quizzapp/widgets/design_quizz_vf.dart';

class SalaQuizzIaPage extends StatelessWidget {
  final String tipoQuizz;

  const SalaQuizzIaPage({Key? key, required this.tipoQuizz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sala Quizz IA'),
      ),
      body: tipoQuizz == '4 respuestas' ? DesignQuizzIa() : DesignQuizzVf(),
    );
  }
}
