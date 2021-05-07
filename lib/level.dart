import 'package:flutter/material.dart';
import 'game1.dart';
import 'game2.dart';
import 'game3.dart';

class Level extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var devSize = MediaQuery.of(context).size;
    return Scaffold(
      //앱바의 배경색을 투명색으로 만들기위해서는 extendBodyBehindAppBar를 true / elevation을 0.0/ 배경색을 0x00000000으로 설정해줘야만 투명으로 설정
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0x00000000),
        ),
        body:
        Container(
            width: devSize.width,
            height: devSize.height,
            color: Colors.amber,
            child:Column(
                children: [

                  SizedBox(height:100),
                  Text("단계",style: TextStyle(fontSize: 100)),
                  SizedBox(height:100),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Game1()));
                  }, child: Text("Level 1",style: TextStyle(fontSize: 80),)),
                  SizedBox(height: 50),
                  ElevatedButton(onPressed: (){

                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Game2()));

                  }, child: Text("Level 2",style: TextStyle(fontSize: 80))),
                  SizedBox(height:50),
                  ElevatedButton(onPressed: (){

                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Game3()));
                  }, child: Text("Level 3",style: TextStyle(fontSize: 80)))



                ]
            )
        )
    );
  }
}


