import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answers.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [
    Message(text: "Hola amor", fromWho: FromWho.mine),
    Message(text: "Ya regresaste del trabajo?", fromWho: FromWho.mine)
  ];

  Future<void> sendMessage(String text) async {
    if( text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);

    if( text.endsWith("?")) {
      herReply();
    }


    // Así como existía un método para decirle a flutter, hey refrescame los cambios, hay un método para este tipo de casos: notifyListenes();
    notifyListeners();
    moveScrollToBottom();
  }


  Future<void> herReply() async{
    final herMessage = await getYesNoAnswer.getAnsWer();
    messageList.add(herMessage);

    notifyListeners();
    moveScrollToBottom();
  }
  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 500), 
      curve: Curves.easeInOut);

  }

}