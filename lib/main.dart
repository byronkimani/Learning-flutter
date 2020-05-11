import 'package:flutter/cupertino.dart';
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
  var _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'blue', 'score': 8},
        {'text': 'brown', 'score': 7},
        {'text': 'red', 'score': 6},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 0}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal',
      'answers': [
        {'text': 'Cat', 'score': 2},
        {'text': 'Bat', 'score': 11},
        {'text': 'Dog', 'score': 4},
        {'text': 'Hen', 'score': 6}
      ],
    },
    {
      'questionText': 'Who\'s your favourite instructor',
      'answers': [
        {'text': 'Max', 'score': 5},
        {'text': 'Max', 'score': 5},
        {'text': 'Max', 'score': 5},
        {'text': 'Max', 'score': 5}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalscore = 0;
  void _answerQuestion(int score) {
    _totalscore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more qustions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalscore),
      ),
    );
  }
}
