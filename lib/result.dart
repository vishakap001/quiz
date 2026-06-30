import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int totalquestions;
  int correct;
  double percentage;
  Result(this.totalquestions, this.correct, this.percentage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(
          title: Text(
            "RESULT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(children: [
            Text("you attempted $totalquestions"),
            Text("out of this u scored $correct answers"),
            Text("${percentage.toStringAsFixed(2)}")
          ],),
        ),
      ),
    );
  }
}
