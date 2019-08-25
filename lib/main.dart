import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Qual é a sua cor favorita?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'A cidade onde nasceu?',
      'answers': [
        {'text': 'Maputo', 'score': 10},
        {'text': 'Beira', 'score': 9},
        {'text': 'Nampula', 'score': 5},
        {'text': 'Xai-xai', 'score': 1},
      ]
    },
    {
      'questionText': 'Quem é a sua noiva?',
      'answers': [
        {'text': 'Céclas', 'score': 10},
        {'text': 'Maluca', 'score': 7},
        {'text': 'Louca', 'score': 3},
        {'text': 'Minha pequena', 'score': 1},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalSoore = 0;

  void _answerQuestion(int score) {
    _totalSoore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('answer chosen: ' + _questionIndex.toString());
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalSoore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalSoore, _resetQuiz),
      ),
    );
  }
}
