import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_bubble_message.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_bubble_message.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_fiel_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Es normal que cuando se use la palabra Screen vaya a retornar un Scaffold. Es un widget como completo
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://styles.redditmedia.com/t5_31ihu/styles/communityIcon_g8jhwcay8ieb1.png"),
          ),
        ),
        title: const Text('Ariana Grande'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  que instancia de provider necesito? ChatProvider.
    final chatProvider = context.watch<ChatProvider>();

    //! Es importante encerrar las screens en este widget SafeArea, para que no quede sobre botones o cosas que hacen parte de la aplicació
    return SafeArea(
      child: Padding(
        //? Una forma de crear paddings que no sean globales, o que sean separados es usanso symetric.
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.mine)
                    ? MyMessageBubble(message: message)
                    : HerMessageBubble();
              },
            )),
            //caja de mensajes
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
