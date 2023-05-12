import 'package:chat_test/main.dart';
import 'package:flutter/material.dart';

class chat_test extends StatelessWidget {
  const chat_test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChatTest()
    );
  }
}

class ChatTest extends StatefulWidget {
  const ChatTest({Key? key}) : super(key: key);

  @override
  State<ChatTest> createState() => _ChatTestState();
}

class _ChatTestState extends State<ChatTest> {
  bool isuser = false;
  final List<String> chat = <String>[];
  TextEditingController a = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
          backgroundColor: Colors.white, // 상단 바 배경색을 흰색으로 설정
          title: Text('ChatBot', style: TextStyle(color: Colors.grey)), // 상단 바 글자색을 검정색으로 설정
            leading: IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            }, icon: Icon(Icons.arrow_back, color: Colors.black,),
            )
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  reverse: true,
                  itemCount: chat.length,
                  itemBuilder: (context, index){
                    return Row(
                      mainAxisAlignment: isuser ? MainAxisAlignment.start : MainAxisAlignment.end,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: isuser ? Colors.green[100] : Colors.grey[300],
                                borderRadius: BorderRadius.circular(8)
                            ),child: Text('${chat[index]}',style: TextStyle(color: Colors.black),)
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${chat[index]}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                                '${chat[index]}'
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              flex: 9,),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: TextField(
                        controller: a,
                      ),
                    ),
                    flex: 8,),
                  Expanded(
                    child: IconButton(
                      onPressed: (){
                        a.text==''?setState((){
                          isuser=false;
                        }):
                        setState(() {
                          isuser=true;
                          chat.insert(0,a.text);
                          print(isuser);
                        });
                      },
                      icon: Icon(Icons.arrow_back),),
                  )
                ],
              ),
              flex: 1,)
          ],
        )
    );
  }
}
