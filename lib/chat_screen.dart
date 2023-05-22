import 'package:flutter/material.dart';

class ChatMessage {
  final String sender;
  final String message;

  ChatMessage({required this.sender, required this.message});
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = [];

  void _sendMessage() {
    setState(() {
      String message = _textController.text;

      // 사용자가 입력한 메시지를 오른쪽에 출력
      _messages.add(ChatMessage(sender: "user", message: message));

      // 입력한 메시지가 "Yes"일 경우 "Yes"라는 답변을 추가하여 왼쪽에 출력
      if (message == "Yes") {
        _messages.add(ChatMessage(sender: "bot", message: "Yes"));
      }

      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                ChatMessage chatMessage = _messages[index];
                bool isUserMessage = chatMessage.sender == "user";

                return ListTile(
                  title: Align(
                    alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isUserMessage ? Colors.blue : Colors.green,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        chatMessage.message,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: '메시지 입력',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Text('전송'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
