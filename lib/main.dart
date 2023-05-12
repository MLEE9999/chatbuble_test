import 'package:chat_test/calendar.dart';
import 'package:chat_test/chat_test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _MyHomePageState()
    );
  }
}


class _MyHomePageState extends StatefulWidget {
  const _MyHomePageState({Key? key}) : super(key: key);

  @override
  State<_MyHomePageState> createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<_MyHomePageState> {
  bool isuser = false;
  final List<String> chat = <String>[];
  TextEditingController a = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
          backgroundColor: Colors.white, // 상단 바 배경색을 흰색으로 설정
          title: Text('연습장', style: TextStyle(color: Colors.grey)), // 상단 바 글자색을 검정색으로 설정
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(),flex: 3,
            ),
            Expanded(
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => chat_test()));
                }, child: Text('채팅 창 연습',style: TextStyle(color: Colors.black),),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => calendar()));
                }, child: Text('버튼 -> 캘린더 연습',style: TextStyle(color: Colors.black),),
              ),
            ),
            Expanded(
              child: Container(),flex: 3,
            ),
          ],
        )
    );
  }
}