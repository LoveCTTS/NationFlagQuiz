import 'package:flutter/material.dart';


class Guide extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //앱바의 배경색을 투명색으로 만들기위해서는 extendBodyBehindAppBar를 true / elevation을 0.0/ 배경색을 0x00000000으로 설정해줘야만 투명으로 설정
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0x00000000),
      ),
      body:
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.amber,
          child:Column(
            children: [

              SizedBox(height:100),
              Text("사용 방법", style: TextStyle(fontSize: 60)),
              Text("abcd")
            ]
          )
        )
    );
  }
}


