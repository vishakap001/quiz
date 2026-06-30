import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/quiz.dart';


class Splash extends StatefulWidget {
   Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Quiz() ,),);}
    );
  }
  Widget build(BuildContext context) {
    
    return Scaffold(body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Lottie.asset("assets/Quiz bump.json")],),),
    );
  }
}