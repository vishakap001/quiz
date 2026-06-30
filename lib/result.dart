import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';

class Result extends StatelessWidget {
  int totalquestions;
  int correct;
  double percentage;
  Result(this.totalquestions, this.correct, this.percentage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "RESULT",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 225, 0),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Column(children: [
            Container(
              height: 190,
              width: 220,
              color: Colors.white,

              child: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGrYV4IdQp_apbRkrbkOALFNZTQ_ZpBv_Xz-hc2IgeDw&s=10"))),
            Text("You Attempted $totalquestions Questions",style: TextStyle(color: const Color.fromARGB(255, 255, 225, 0),fontSize: 23,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
            Text("Out Of This You Scored $correct Answers",style: TextStyle(color: const Color.fromARGB(255, 84, 252, 90),fontSize: 23,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
            Text("${percentage.toStringAsFixed(2)}%",style: TextStyle(color: const Color.fromARGB(255, 255, 225, 0),fontSize: 33),),
            ElevatedButton(onPressed: (){
              if(percentage<=40.00){
                Navigator.push(context,  MaterialPageRoute(builder: (context) => Quiz()));
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.grey,content: Text("Thanks for your response",style: TextStyle(color: Colors.black),))) ;
              }
            }, child: Text(percentage<40.00?"Try Again":"Completed"))
          ],),
        ),
      ),
    );
  }
}
