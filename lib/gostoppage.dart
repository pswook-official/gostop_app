import 'package:flutter/material.dart';

class GoStopPage extends StatefulWidget {
  const GoStopPage({Key? key}) : super(key: key);

  @override
  State<GoStopPage> createState() => _GoStopPageState();
}

class _GoStopPageState extends State<GoStopPage> {

  final player1Controller=TextEditingController();
  final player2Controller=TextEditingController();
  final player1MoneyController=TextEditingController();
  final player2MoneyController=TextEditingController();
  final moneyController=TextEditingController();

  String pl1Name="player1";
  String pl2Name="player2";
  int pl1Money=0;
  int pl2Money=0;
  int shareMoney=0;

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: height*0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: player1Controller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                        ),
                                        labelStyle: TextStyle(
                                          color: Colors.teal,
                                        ),
                                        labelText: 'player_1_name',
                                      ),
                                  ),
                                ),Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: player1MoneyController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                          color: Colors.teal,
                                        ),
                                        labelText: 'player_1_money',
                                      ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: player2Controller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                          color: Color(0xff6f4f28),
                                        ),
                                        labelText: 'player_2_name',
                                      ),
                                  ),
                                ),Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: player2MoneyController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(
                                          color: Color(0xff6f4f28),
                                        ),
                                        labelText: 'player_2_money',
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              InkWell(
                onTap: (){
                  setState(() {
                    changeInfo();
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 50,
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'game start',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: height*0.6,
                child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                          pl1Name,
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      Text(
                                          "$pl1Money",
                                        style: TextStyle(
                                          color:Colors.teal,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(child: Container()),
                                  Expanded(child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      SizedBox(height: 10,),
                                      TextField(
                                        controller: moneyController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'money',
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                        Text("Who win??"),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  pl1Win();
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: Colors.teal,
                                                child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(
                                                    pl1Name,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  pl2Win();
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: Colors.teal,
                                                child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(
                                                    pl2Name,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],),
                                  )),
                                  Expanded(child: Container()),

                                ],
                              ),
                            )
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      pl2Name,
                                      style: TextStyle(
                                        color:Color(0xff6f4f28),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "$pl2Money",
                                      style: TextStyle(
                                        color:Color(0xff6f4f28),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ],
          ),
      ),
    );
  }

  void changeInfo() {
    pl1Name=player1Controller.text;
    pl1Money=int.parse(player1MoneyController.text);
    pl2Name=player2Controller.text;
    pl2Money=int.parse(player2MoneyController.text);
  }

  void pl1Win() {
    pl1Money=pl1Money+int.parse(moneyController.text);
    pl2Money=pl2Money-int.parse(moneyController.text);
  }
  void pl2Win() {
    pl2Money=pl2Money+int.parse(moneyController.text);
    pl1Money=pl1Money-int.parse(moneyController.text);
  }
}
