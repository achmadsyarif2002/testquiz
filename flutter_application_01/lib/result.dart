import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetQuiz;
  final String phrase;
  final int score;
  Result({this.resetQuiz, this.phrase, this.score});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Congratss \n You did it!',
            style: TextStyle(fontSize: 19.0),
          ),
        ),
        Text(
          'Your score : $score \n Predikat : ' + phrase,
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: RaisedButton(
            child: Text('Reset'),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
              resetQuiz();
            },
          ),
        ),
      ],
    );
  }
}
