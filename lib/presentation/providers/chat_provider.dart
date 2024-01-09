import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  List<Message> messageList = [
    Message(text: "Hola amor", fromWho: FromWho.mine),
    Message(text: "Ya regresaste del trabajo?", fromWho: FromWho.mine)
  ];

  Future<void> sendMesage() async {
    //TODO: implementar metodo
  }


}