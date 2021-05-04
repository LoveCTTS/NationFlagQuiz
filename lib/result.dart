import 'package:flutter/material.dart';

import 'main.dart';


class Result extends StatelessWidget {


  final int resultScore;

  Result({@required this.resultScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/kr.png"),
                fit: BoxFit.cover,
              )
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("$resultScore", style: TextStyle(fontSize: 100,color: Colors.black)),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyApp()), (route) => false);
              }, child: Text("처음으로"))
            ],
          )
        )
    );
  }
}


