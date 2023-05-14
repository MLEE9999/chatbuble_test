import 'package:chat_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class calendar extends StatelessWidget {
  const calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'), // 한국어
        const Locale('en', 'US'), // 영어
      ],
      debugShowCheckedModeBanner: false,
      home: Calendar(),
    );
  }
}


class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? _selectedDate;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
          backgroundColor: Colors.white, // 상단 바 배경색을 흰색으로 설정
          title: Text('캘린더 연습', style: TextStyle(color: Colors.grey)), // 상단 바 글자색을 검정색으로 설정
            leading: IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            }, icon: Icon(Icons.arrow_back, color: Colors.black,),
            )
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(),flex: 3,
            ),
            Expanded(
              child: TextButton(
                onPressed: (){
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                      locale: const Locale('ko', 'KO'), // 한국어 설정
                      helpText: '출산 예정일을 선택해주세요'
                  ).then((selectedDate){
                    setState((){
                      _selectedDate = selectedDate;
                    });
                  });
                }, child: Text('캘린더 호출',style: TextStyle(color: Colors.black),),
              ),
            ),
            Expanded(
              child:
              Text(_selectedDate!=null?
                  _selectedDate.toString().split(" ")[0]
                  :
                  '날싸 선택하세요'
                ,style: TextStyle(color: Colors.black),)
            ),
            Expanded(
              child: Container(),flex: 3,
            ),
          ],
        )
    );
  }
}
