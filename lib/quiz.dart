import 'package:flutter/material.dart';
import 'package:quiz/quizques.dart';
import 'package:quiz/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late PageController page;
  late List<String?> userans;
  @override
  void initState() {
    super.initState();
    page = PageController();
    userans = List.filled(question.length, null);
  }

  Color getoptiontextcolor(String option, int index) {
    if (userans[index] != null) {
      if (question[index]["correct"] == option) {
        return Colors.green;
      } else if (userans[index] == option) {
        return Colors.red;
      } else {
        return const Color.fromARGB(255, 36, 36, 36);
      }
    }
    return const Color.fromARGB(255, 36, 36, 36);
  }

  void showResult() {
    int totalquestions = question.length;
    int correct = 0;
    for (int i = 0; i < totalquestions; i++) {
      if (userans[i] == question[i]["correct"]) {
        correct++;
      }
    }
    double percentage=(correct/totalquestions)*100;
    Navigator.push(context, MaterialPageRoute(builder: (context) => Result(totalquestions, correct, percentage),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: 
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          question[index]["que"],
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: List.generate(
                          question[index]["options"].length,
                          (oindex) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    userans[index] =
                                        question[index]["options"][oindex];
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: getoptiontextcolor(
                                      question[index]["options"][oindex],
                                      index,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                      question[index]["options"][oindex],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (index < question.length - 1) {
                            page.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.ease,
                            );
                          } else {
                            showResult();
                          }
                        },
                        child: Text(
                          index < question.length - 1 ? "Next" : "Submit",
                          
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: question.length,
              controller: page,
            ),
          ),
     
    );
  }
}
