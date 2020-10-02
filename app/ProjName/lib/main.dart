import 'package:flutter/material.dart';

void main() {
  runApp(
    FriendlyChatApp(),
  );
}

class FriendlyChatApp  extends StatelessWidget {
  const FriendlyChatApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FriendlyChat',
      home: ChatScreen()
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key key,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  
  void _handleSubmitted(String text){
    _textController.clear();
  }
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('FriendlyChats')),
      body: _buildTextComposer(),
    );

  }
  Widget _buildTextComposer(){
    return IconTheme(
          data: IconThemeData(color: Theme.of(context).accentColor),
          child: Container(
        margin:EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted:  _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'send message'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: ()=> _handleSubmitted(_textController.text),
              )
            )
          ],
        ),
      ),
    );
  }
}
