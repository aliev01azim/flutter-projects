// import 'package:flutter/material.dart';

// import './question.dart';
// import './answer.dart';

// class Quiz extends StatelessWidget {
//   final List<Map<String, Object>> questions;
//   final int questionIndex;
//   final Function answerQuestion;

//   Quiz({
//     @required this.questions,
//     @required this.answerQuestion,
//     @required this.questionIndex,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Question(
//           questions[questionIndex]['questionText'],
//         ),
//         ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
//             .map((answer) {
//           return Answer(() => answerQuestion(answer['score']), answer['text']);
//         }).toList()
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final Function answer;
  final Map<String, Object> questions;
  Quiz(this.answer, this.questions);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Chip(label: Text(questions['questionText']))),
        SizedBox(
          height: 20,
        ),
        ...((questions['answers']) as List)
            .map((e) => buildAnswer(e['text'], e['score']))
            .toList()
      ],
    );
  }

  Widget buildAnswer(String text, int score) {
    return RaisedButton(
      onPressed: () => answer(score),
      child: Text(text),
      padding: EdgeInsets.only(
        bottom: 20,
      ),
    );
  }
}
