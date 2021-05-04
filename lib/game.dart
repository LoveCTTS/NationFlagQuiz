import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'result.dart';
import 'dart:math';

class Game extends StatefulWidget {

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<Game> {

  final CountdownController _controller = CountdownController();
  int pageCount= 1;
  dynamic nationFlag = ["images/kr.png", "images/jp.png", "images/cn.png", "images/br.png", "images/us.png",
                        "images/se.png", "images/fr.png", "images/de.png", "images/id.png", "images/in.png"
                        ];
  List<String> nationName = ["대한민국", "일본", "중국", "브라질", "미국",
                              "스웨덴", "프랑스", "독일", "인도네시아", "인도"];

  int randomDeploy = Random().nextInt(3);
  int randomNumber1 = Random().nextInt(10);
  int randomNumber2 = Random().nextInt(10);

  int score = 0;

  bool _isSame = false;


  void nextQuiz(){

    setState(() {
      if(pageCount == 10){

        pageCount =1;
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Result(resultScore: score)));

      }
      pageCount += 1;
      _controller.restart();

      /*while(true){
        if(randomNumber1 == pageCount ){

          randomNumber1 = Random().nextInt(10);
          if(randomNumber1 != pageCount){
            break;
          }
        }

      }
      while(true){
        if(randomNumber2 == pageCount ){

          randomNumber1 = Random().nextInt(10);
          if(randomNumber2 != pageCount){
            break;
          }
        }

      }*/

      randomDeploy = Random().nextInt(3);
      randomNumber1 = Random().nextInt(10);
      randomNumber2= Random().nextInt(10);

    });

  }







  @override
  Widget build(BuildContext context) {

    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0, //명암
        backgroundColor: Color(0x000000000),
        title: Countdown(
          controller: _controller,
          seconds: 10,
          build: (_, double time) => Text(
            time.toString(),
            style: TextStyle(
              fontSize: 30
            ),
          ),
          interval: Duration(microseconds: 1000),
          onFinished: (){
            print("Finish!");
            setState(() {
              if(pageCount ==10){
                pageCount =1;
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Result(resultScore: score)));
              }
              pageCount += 1;
              _controller.restart();
              randomDeploy = Random().nextInt(3);
              randomNumber1 = Random().nextInt(10);
              randomNumber2= Random().nextInt(10);
            });
          },
        ),
        actions: [
          Text("$pageCount/10",style: TextStyle(fontSize: 30))
        ]
      ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.amber,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            SizedBox(height:10),
            Image.asset(nationFlag[pageCount-1]),
            randomDeploy==0?
                Container(child: Column(

                    children: [
                  ElevatedButton(onPressed: (){
                    nextQuiz();
                    score += 10;
                  }, child: Text("${nationName[pageCount-1]}",style: TextStyle(fontSize: 50))), SizedBox(height:40),
                  ElevatedButton(
                      onPressed: (){

                        nextQuiz();
                  },
                      child: Text("${nationName[randomNumber1]}",style: TextStyle(fontSize: 50))
                  ),
                      SizedBox(height:40),
                      ElevatedButton(onPressed: (){

                    nextQuiz();
                  }, child: Text("${nationName[randomNumber2]}",style: TextStyle(fontSize: 50)))
                ])):

                randomDeploy==1?
                Container(child: Column(children: [
                  ElevatedButton(onPressed: (){

                    nextQuiz();

                  }, child: Text("${nationName[randomNumber1]}",style: TextStyle(fontSize: 50))),SizedBox(height:40),
                  ElevatedButton(onPressed: (){
                    nextQuiz();
                    score += 10;
                  }, child: Text("${nationName[pageCount-1]}",style: TextStyle(fontSize: 50))),SizedBox(height:40),
                  ElevatedButton(onPressed: (){
                    nextQuiz();
                  }, child: Text("${nationName[randomNumber2]}",style: TextStyle(fontSize: 50)))
                ])):

                    randomDeploy==2?
                    Container(child: Column(children: [
                      ElevatedButton(onPressed: (){

                        nextQuiz();
                      }, child: Text("${nationName[randomNumber1]}",style: TextStyle(fontSize: 50))),SizedBox(height:40),
                      ElevatedButton(onPressed: (){

                        nextQuiz();
                      }, child: Text("${nationName[randomNumber2]}",style: TextStyle(fontSize: 50))),SizedBox(height:40),
                      ElevatedButton(onPressed: (){
                        nextQuiz();
                        score += 10;
                      }, child: Text("${nationName[pageCount-1]}",style: TextStyle(fontSize: 50)))
                    ])): SizedBox.shrink()






          ])
        )
    );
  }
}
