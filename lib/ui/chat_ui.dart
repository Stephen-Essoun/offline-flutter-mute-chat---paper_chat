import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:paper_chat/provider/db_provider.dart';
import 'package:paper_chat/utils/chat_textfield.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => ChatViewState();
}

class ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    var chats = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MuteChat',
        ),
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: bgColor,
              child: ListView.builder(
                reverse: true,
                itemCount: chats.message.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        if (chats.message[index].messageType == 'sender')
                          const Spacer(),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.8),
                          child: Bubble(
                            nip: chats.message[index].messageType == 'receiver'
                                ? BubbleNip.leftTop
                                : BubbleNip.rightTop,
                            nipWidth: 10,
                            color:
                                chats.message[index].messageType == 'receiver'
                                    ? white
                                    : color,
                            alignment:
                                chats.message[index].messageType == 'receiver'
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                            child: Text(
                              chats.message[index].messageContent,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        if (chats.message[index].messageType == 'receiver')
                          const Spacer(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Stack(children: const [ChatTextField()]),
        ],
      ),
    );
  }
}
