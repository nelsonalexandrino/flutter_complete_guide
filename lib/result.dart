import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Result extends StatelessWidget {
  final int result;
  final Function resetQuiz;

  Result(this.result, this.resetQuiz);

  String get resultPhrase {
    return 'You made it!!! Congrants: ' + result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child: Text(
              'play again',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
