import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{

  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 14,
              child: Text('Te', style:TextStyle(color: Colors.black, fontSize: 12))
            ),
            SizedBox(height: 3,),
            Text("Nombre Completo", style: TextStyle(fontSize: 14),)
          ],
        ),
        elevation: 1,
      ),
      body: Container(
        color: Colors.grey[900],
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
              ),
            ),
            Divider( height: 3,),

            //TODO: Caja de texto
            Container(
              color: Colors.pinkAccent,
              child: _inputChat(),
            )
          ],
        )
      ),
   );
  }

  Widget _inputChat(){

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, ),
        child: Row(
          children: [
            
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: ( String texto ){
                  //Cuando hay valor hacer POST
                  if (texto.trim().length > 0 ){
                    _estaEscribiendo = true;
                  } else {
                    _estaEscribiendo = false;
                  }
                  setState(() {});
                },

                decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                focusNode: _focusNode,
              ),
            ),

            //Boton de enviar
            Container(
              margin: EdgeInsets.symmetric(horizontal:4),
              child: Platform.isIOS 
              ? CupertinoButton(
                  child: Text('Enviar'),
                  onPressed: _estaEscribiendo
                  ? () => _handleSubmit(_textController.text.trim()) 
                  : null,
              ) 
              : Container(
                margin: EdgeInsets.symmetric(horizontal:4),
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon(Icons.send),
                  onPressed: _estaEscribiendo
                  ? () => _handleSubmit(_textController.text.trim()) 
                  : null,
                ),
              ),
            )

          ],
        ),

      ),
    );

  }



  _handleSubmit(String texto){
    
    if (texto.length == 0) return;

    _focusNode.requestFocus();
    _textController.clear();

    final newMessage = new ChatMessage(
      uid: '123',
      texto: texto,
      animationController: AnimationController(
        vsync: this, duration: Duration(milliseconds: 200)
      ),);
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: Off del socket

    for (ChatMessage message in _messages){
      message.animationController.dispose();
    }

    super.dispose();
  }
}