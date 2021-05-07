import 'package:flutter/material.dart';
import 'guide.dart';
import 'game1.dart';
import 'level.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Text("국기 암기왕",style: TextStyle(fontSize: 80)),

            Image.asset("images/eg.png"),

            ElevatedButton(
              onPressed: (){

                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Guide()));

              },
              child: Text("사용 방법")
            ),
            ElevatedButton(onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Level()));

            }, child: Text("게임 시작"))
          ],
        )
      )

    );
  }
}
