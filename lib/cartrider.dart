import 'package:flutter/material.dart';

class CountPeople extends StatefulWidget {
  const CountPeople({Key? key}) : super(key: key);

  @override
  State<CountPeople> createState() => _CountPeopleState();
}

class _CountPeopleState extends State<CountPeople> {

  TextEditingController mycontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("게임인원을 입력하세요"),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: mycontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "인원수 입력하기",
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: ()async{
                  final peoplenum=PeopleNum(int.parse(mycontroller.text));
                  await Navigator.push(context, MaterialPageRoute(builder: (context)=>IdPage(peoplenum:peoplenum)));
                },
                child: Text("게임시작"),
            ),
          ],
        ),
      ),
    );
  }
}

class IdPage extends StatefulWidget {
  final PeopleNum peoplenum;
  IdPage({required this.peoplenum});

  @override
  State<IdPage> createState() => _IdPageState();
}

class _IdPageState extends State<IdPage> {

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    int num=widget.peoplenum.num;
    List<TextEditingController> _controller=[];

    return Scaffold(
      appBar: AppBar(title: Text("app"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 500,
            child: Form(
              key: formKey,
              child: ListView.builder(
                  itemBuilder: (BuildContext context,int num){
                    _controller.add(new TextEditingController());
                    return Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        controller: _controller[num],
                        decoration: InputDecoration(
                            labelText: "player_"+"$num"+"_ID"
                        ),
                      ),
                    );
                    },
                itemCount: num,
            ),
          ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: ()async{
                await ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("아이디가 저장되었습니다."),
                    ),
                );
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RoundPage(controller: _controller,numPeople:_controller.length)));
              },
              child: Text("게임시작"),
          ),
        ],
      ),
    );
  }
}

class RoundPage extends StatefulWidget {

  List<TextEditingController> controller;
  int numPeople;
  RoundPage({Key? key,required this.controller,required this.numPeople}) : super(key: key);

  final _items=[]; //_items가 인원수 숫자에 맞게 만들어져야함
  var _selected='등수';

  @override
  State<RoundPage> createState() => _RoundPageState();
}

class _RoundPageState extends State<RoundPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context,int num){
            return Container(
              margin: EdgeInsets.all(5),
              height: 50,
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                      flex:2,
                      child: Center(child: Text(widget.controller[num].text)),
                  ),
                  Expanded(
                      flex: 1,
                      child: DropdownButton(
                        value: widget._selected,
                        items: widget._items.map((value){
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }
                        ).toList(),
                        onChanged: (value){
                          setState((){
                            widget._selected=value.toString();
                          });
                        },
                      ),
                  ),
                ],
              ),
            );
          },
          itemCount: widget.controller.length,
        ),
      ),
    );
  }
}


class PeopleNum{
  int num;
  PeopleNum(this.num);
}
class PeopleId{
  String id;
  PeopleId(this.id);
}




