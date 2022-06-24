import 'package:flutter/material.dart';
import 'package:vir_money/gostoppage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'virMoney',
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: ChoicePage(),
    );
  }
}

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('images/gostop.png'),
            ),
            Container(
              width: 200,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GoStopPage()));
                  },
                  child: Text('시작'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

