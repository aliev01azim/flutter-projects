// import 'package:flutter/material.dart';

// class Result extends StatelessWidget {
//   final int resultScore;
//   final Function resetHandler;

//   Result({this.resultScore, this.resetHandler});

//   String get resultPhrase {
//     String resultText;
//     if (resultScore <= 8) {
//       resultText = 'You are awesome and innocent!';
//     } else if (resultScore <= 12) {
//       resultText = 'Pretty likeable!';
//     } else if (resultScore <= 16) {
//       resultText = 'You are ... strange?!';
//     } else {
//       resultText = 'You are so bad!';
//     }
//     return resultText;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           Text(
//             resultPhrase,
//             style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           FlatButton(
//             child: Text(
//               'Restart Quiz!',
//             ),
//             textColor: Colors.blue,
//             onPressed: resetHandler,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function restart;
  final int score;
  Result(this.restart, this.score);
  String get resultText {
    String text;
    if (score <= 8) {
      text = 'sadadad';
    } else if (score <= 12) {
      text = 'bbbbbbbbbbb';
    } else if (score <= 16) {
      text = 'krasava';
    } else {
      text = 'ne ponyal';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Chip(label: Text(resultText)),
        ),
        RaisedButton(
          onPressed: restart,
          child: Text('asdsad'),
        )
      ],
    );
  }
}
