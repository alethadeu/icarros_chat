import 'package:flutter/material.dart';

import 'chat_message.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({Key key, this.title = "Chat"}) : super(key: key);
  

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];             
  final TextEditingController _textController = new TextEditingController();

   @override 
  void dispose() {
    for(ChatMessage message in _messages)
        message.animationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding:  EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor),
               child: _buildTextComposer(), 
              ),
          ],
        ),
      ),
    );
  }


  Widget _buildTextComposer() {
      return  IconTheme(                                            
        data:  IconThemeData(color: Theme.of(context).accentColor), 
        child:  Container(                                     
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child:  Row(
            children: <Widget>[
               Flexible(
                child:  TextField(
                  controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:  InputDecoration.collapsed(
                  hintText: "Enviar Mensagem"),
              ),
            ),
            Container(
                margin:  EdgeInsets.symmetric(horizontal: .0),
                child:  IconButton(
                  icon:  Icon(Icons.send),
                  color: Colors.blue,
                  onPressed: () => _handleSubmitted(_textController.text)
                ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(text, AnimationController(
      duration: Duration(milliseconds: 700), 
      vsync:  this,
    ), "Alexandre");                                                             
    setState(() {                                                  
      _messages.insert(0, message);                                
    });
    message.animationController.forward();                                                            
  }
}

