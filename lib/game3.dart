import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'result.dart';
import 'dart:math';

class Game3 extends StatefulWidget {

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<Game3> {

  final CountdownController _controller = CountdownController();
  int pageCount= 1;
  dynamic nationFlag = [
    "images/kr.png", "images/jp.png", "images/cn.png", "images/br.png", "images/us.png",
    "images/se.png", "images/fr.png", "images/de.png", "images/id.png", "images/in.png",
    "images/ph.png","images/sa.png", "images/tr.png", "images/ua.png","images/it.png",
    "images/ru.png","images/tw.png","images/th.png", "images/sk.png","images/cz.png",
    "images/dk.png","images/gb-eng.png","images/vn.png","images/pk.png","images/ch.png",
    "images/gn.png","images/gr.png","images/hk.png","images/pl.png","images/ng.png"

  ];
  List<String> nationName = [
    "대한민국", "일본", "중국", "브라질", "미국",
    "스웨덴", "프랑스", "독일", "인도네시아", "인도",
    "필리핀", "사우디아라아","터키","우즈베키스탄","이탈리아",
    "러시아","대만","태국","슬로바키아","체코",
    "덴마크","잉글랜드","베트남","파키스탄","스위스",
    "가나","그리스","홍콩","폴란드","나이지리아",
    "헝가리","카메룬" //이 두 국가는 없어도되지만, 배열의 에러 방지를위해 미리넣어둔 데이터
  ];

  int randomDeploy = Random().nextInt(3);
  double score = 0;


  void nextQuiz(){

    setState(() {
      if(pageCount == 30){

        pageCount =1;
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Result(resultScore: score.toInt())));

      }
      pageCount += 1;
      _controller.restart();

      randomDeploy = Random().nextInt(3);


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

                  if(pageCount ==30){

                    pageCount =1;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Result(resultScore: score.toInt())));
                  }

                  pageCount += 1;
                  _controller.restart();
                  randomDeploy = Random().nextInt(3);

                });
              },
            ),
            actions: [
              Text("$pageCount/30",style: TextStyle(fontSize: 30))
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
                          score += 3.3 ;
                        }, child: Text("${nationName[pageCount-1]}",style: TextStyle(fontSize: 50))), SizedBox(height:40),
                        ElevatedButton(
                            onPressed: (){

                              nextQuiz();
                            },
                            child: Text("${nationName[pageCount]}",style: TextStyle(fontSize: 50))
                        ),
                        SizedBox(height:40),
                        ElevatedButton(onPressed: (){

                          nextQuiz();
                        }, child: Text("${nationName[pageCount+1]}",style: TextStyle(fontSize: 50)))
                      ])):

                  randomDeploy==1?
                  Container(child: Column(children: [
                    ElevatedButton(onPressed: (){

                      nextQuiz();

                    }, child: Text("${nationName[pageCount]}",style: TextStyle(fontSize: 50))),SizedBox(height:40),
                    ElevatedButton(onPressed: (){
                      nextQuiz();
                      score += 3.3 ;
                    }, child: Text("${nationName[pageCount-1]}",style: TextStyle(fontSize: 50))),SizedBox(height:40),
                    ElevatedButton(onPressed: (){
                      nextQuiz();
                    }, child: Text("${nationName[pageCount+1]}",style: TextStyle(fontSize: 50)))
                  ])):

                  randomDeploy==2?
                  Container(child: Column(children: [
                    ElevatedButton(onPressed: (){

                      nextQuiz();
                    }, child: Text("${nationName[pageCount]}",style: TextStyle(fontSize: 50))),SizedBox(height:40),
                    ElevatedButton(onPressed: (){

                      nextQuiz();
                    }, child: Text("${nationName[pageCount+1]}",style: TextStyle(fontSize: 50))),SizedBox(height:40),
                    ElevatedButton(onPressed: (){
                      nextQuiz();
                      score += 3.3;
                    }, child: Text("${nationName[pageCount-1]}",style: TextStyle(fontSize: 50)))
                  ])): SizedBox.shrink()


                ])
        )
    );
  }
}
