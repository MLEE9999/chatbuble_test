import 'dart:convert';
import 'package:chat_test/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class change_pw extends StatelessWidget {
  const change_pw({Key? key,required this.userNum, this.index}) : super(key: key);

  final userNum, index;

  @override
  Widget build(BuildContext context) {
    print("change_pw 페이지");
    print(userNum);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangePw(UserNum: userNum, index: index)
    );
  }
}

class ChangePw extends StatefulWidget {
  const ChangePw({Key? key, this.UserNum, this.index}) : super(key: key);

  final UserNum, index;

  @override
  State<ChangePw> createState() => _ChangePwState();
}

class _ChangePwState extends State<ChangePw> {

  TextEditingController PW1 = TextEditingController(); // 비밀번호 입력 컨트롤러
  TextEditingController PW2 = TextEditingController();
  TextEditingController PW3 = TextEditingController();

  // Future change_password() async{ //비밀번호 인증+변경
  //   final uri = Uri.parse('http://182.219.226.49/moms/change-pw/pw/afterlogin'); // 링크 받아와야함
  //   final headers = {'Content-Type': 'application/json'};
  //
  //   final user_num = widget.UserNum; // 유저번호
  //   final pw_now = PW1.text;
  //   final pw_change = PW2.text;
  //
  //   final body = jsonEncode({'clientNum': user_num,'pw': pw_now, 'changepw': pw_change}); // 입력값 받아와야함
  //   final response = await http.post(uri, headers: headers, body: body);
  //   if(response.statusCode == 200){
  //     print('성공');
  //     return 1;
  //   } else{
  //     return 0;
  //   }
  // }

  Future Epopup(String message, int check){
    var change_check = 0;
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(""),
            content: Text(message),
            actions: [
              OutlinedButton(
                  onPressed: (){
                    // if(check == 3)
                    //   change_check = change_password();
                    print(check);
                    print(change_check);
                    if(change_check==1)
                      Navigator.of(context).pop(); // change_user_info로 이동
                    else {
                      print("오류");
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("확인",style: TextStyle(color: Colors.black)))
            ],
          );
        }
    );
  }
  var check = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
          backgroundColor: Colors.white, // 상단 바 배경색을 흰색으로 설정
          title: Text('비밀번호 변경', style: TextStyle(color: Colors.grey)), // 상단 바 글자색을 검정색으로 설정
          leading: IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
          }, icon: Icon(Icons.arrow_back, color: Colors.black,),
          )
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0,40,0,20),
                child: Text("빈칸에 맞에 비밀번호를 입력해주세요",style: TextStyle(color: Colors.black,fontSize: 20)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,5,0,0),
                child: Text("현재 비밀번호를 입력해주세요",style: TextStyle(color: Colors.black)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(100,5,100,30),
                child: TextField(
                  obscureText: true,
                  controller: PW1,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "현재 비밀번호",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,5,0,0),
                child: Text("변경할 비밀번호를 입력해주세요",style: TextStyle(color: Colors.black)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(100,5,100,30),
                child: TextField(
                  obscureText: true,
                  controller: PW2,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "변경할 비밀번호",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,5,0,0),
                child: Text("변경할 비밀번호를 다시 입력해주세요",style: TextStyle(color: Colors.black)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(100,5,100,0),
                child: TextField(
                  obscureText: true,
                  controller: PW3,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "변경할 비밀번호 재입력",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,40,0,0),
                child: Container(
                  width: 150,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: (){
                      print(check);
                      if(PW1.text!=""&&PW2.text!=""&&PW3.text!="")
                        check = 1;
                      if(check==1&&PW2.text==PW3.text)
                        check = 2;
                      if(check==2&&PW1.text!=PW2.text)
                        check = 3;
                      if(check == 0)
                        Epopup("빈칸 없이 입력해주세요",check);
                      else if(check == 1)
                        Epopup("변경할 비밀번호가 일치하지 않습니다",check);
                      else if(check == 2)
                        Epopup("현재 비밀번호와 변경할 비밀번호가 일치하지 않습니다",check);
                      else if(check == 3) {
                        Epopup("비밀변호 변경이 완료되었습니다.",check);
                      }
                    },child: Text("확인",style: TextStyle(color: Colors.black))
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}