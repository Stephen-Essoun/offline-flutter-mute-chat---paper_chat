import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:paper_chat/provider/db_provider.dart';
import 'package:paper_chat/utils/chat_textfield.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  // bool isCurrentUser = false;
  @override
  Widget build(BuildContext context) {
    var chats = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MuteChat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.amber,
              child: ListView.builder(
                reverse: true,
                itemCount: chats.message.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Bubble(
                      nip: chats.message[index].messageType == 'receiver'
                          ? BubbleNip.leftTop
                          : BubbleNip.rightTop,
                      nipWidth: 10,
                      color: chats.message[index].messageType == 'receiver'
                          ? Colors.blue
                          : Colors.grey[300],
                      alignment: chats.message[index].messageType == 'receiver'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        chats.message[index].messageContent,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ChatTextField(),
        ],
      ),
    );
  }
}
