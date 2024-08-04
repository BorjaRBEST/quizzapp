import 'package:flutter/material.dart';

class DesignQuizzIa extends StatefulWidget {
  final String tipoQuizz;
  final int numeroPreguntas;

  const DesignQuizzIa({
    Key? key,
    required this.tipoQuizz,
    required this.numeroPreguntas,
  }) : super(key: key);

  @override
  _DesignQuizzIaState createState() => _DesignQuizzIaState();
}

class _DesignQuizzIaState extends State<DesignQuizzIa> {
  int _currentQuestionIndex = 0;
  late List<Map<String, dynamic>> _questions;

  @override
  void initState() {
    super.initState();
    _questions = List.generate(widget.numeroPreguntas, (index) {
      return {
        'question': 'Pregunta ${index + 1}',
        'answers': [
          {'text': 'Respuesta A', 'correct': index % 4 == 0},
          {'text': 'Respuesta B', 'correct': index % 4 == 1},
          {'text': 'Respuesta C', 'correct': index % 4 == 2},
          {'text': 'Respuesta D', 'correct': index % 4 == 3},
        ],
      };
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
      }
    });
  }

  void _deleteQuestion() {
    setState(() {
      if (_questions.isNotEmpty) {
        _questions.removeAt(_currentQuestionIndex);
        if (_currentQuestionIndex >= _questions.length) {
          _currentQuestionIndex = _questions.length - 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: _questions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Pregunta ${index + 1}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _questions[index]['answers']
                              .map<Widget>((answer) => Text(answer['text']))
                              .toList(),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        currentQuestion['question'],
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ...currentQuestion['answers'].map<Widget>((answer) {
                        return ListTile(
                          title: Text(answer['text']),
                          leading: Icon(
                            answer['correct']
                                ? Icons.check_circle
                                : Icons.circle,
                            color:
                                answer['correct'] ? Colors.green : Colors.grey,
                          ),
                        );
                      }).toList(),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: _previousQuestion,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: _deleteQuestion,
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: _nextQuestion,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Acción para crear sala
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text('Crear Sala'),
          ),
        ],
      ),
    );
  }
}
