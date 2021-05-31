import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final List<Map<String, Object>> soal2;
  int questionIndex;
  Question(this.soal2, this.questionIndex);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          soal2[questionIndex]['text'],
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
