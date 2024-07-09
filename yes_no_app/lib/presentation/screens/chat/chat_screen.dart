import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';




class ChatScreen extends StatelessWidget{
  const ChatScreen({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/736x/9c/50/2c/9c502ca51a038bf0d3c1262ca6f9ae38.jpg'),
          ),
        ),
        title: const Text('Usuario'),
        centerTitle: false,
      ),
      body:  _ChatView(),
    );
  }

}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: 
              ListView.builder(
                controller:chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index  ){
                  //return (index % 2 == 0) ? const MyMessage() : const HerMessage();
                  final message = chatProvider.messages[index];
                  return (message.fromWho == FromWho.me) 
                  ?  MyMessage(message:message)
                  :  HerMessage( message: message,);

                 // if(index % 2 == 0){
                 //   return const MyMessage();
                //  }
                //  return const HerMessage();
              }
              )
            ),
            MessageFieldBox(
            //onValue:(value)=> chatProvider.sendMessages(value),)
            onValue: chatProvider.sendMessage,
            ),
          ]
        ),
      ),
    );
  }
}