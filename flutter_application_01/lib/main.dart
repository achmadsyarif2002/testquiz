import 'package:flutter/material.dart';
import 'package:flutter_application_01/question.dart';
import 'package:flutter_application_01/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: 'Flutter Apps',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int score = 0;
  String ucapan;
  String get phrase {
    if (score == soal2.length) {
      ucapan = 'Sempurna';
    } else if (score > (soal2.length / 2)) {
      ucapan = 'Bagus';
    } else {
      ucapan = 'Kurang Bagus';
    }
    return ucapan;
  }

  final soal2 = [
    {
      'text': '14+24=...?',
      'answer': [
        {'text': '10', 'score': 0},
        {'text': '40', 'score': 0},
        {'text': '36', 'score': 0},
        {'text': '38', 'score': 1}
      ]
    },
    {
      'text': '34+22=...?',
      'answer': [
        {'text': '56', 'score': 1},
        {'text': '42', 'score': 0},
        {'text': '12', 'score': 0},
        {'text': '10', 'score': 0}
      ]
    },
    {
      'text': '42+123=...?',
      'answer': [
        {'text': '120', 'score': 0},
        {'text': '140', 'score': 0},
        {'text': '165', 'score': 1},
        {'text': '230', 'score': 0}
      ]
    },
    {
      'text': '12+52=...?',
      'answer': [
        {'text': '30', 'score': 0},
        {'text': '20', 'score': 0},
        {'text': '64', 'score': 1},
        {'text': '41', 'score': 0}
      ]
    },
    {
      'text': '51+23=...?',
      'answer': [
        {'text': '20', 'score': 0},
        {'text': '43', 'score': 0},
        {'text': '62', 'score': 0},
        {'text': '74', 'score': 1}
      ]
    },
  ];

  int _questionIndex = 0;

  void nextQuestion(int score2) {
    setState(() {
      score += score2;
      _questionIndex += 1;
      print(score);
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(soal2.length);
    print(_questionIndex);
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Quiz'),
        ),
        body: _questionIndex < soal2.length
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Question(soal2, _questionIndex),
                    ...(soal2[_questionIndex]['answer']
                            as List<Map<String, Object>>)
                        .map((e) {
                      return Container(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            nextQuestion(e['score']);
                          },
                          child: Text(
                            e['text'],
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      );
                    }).toList()
                  ],
                ),
              )
            : Result(
                phrase: phrase,
                score: score,
                resetQuiz: _resetQuiz,
              ));
  }
}
