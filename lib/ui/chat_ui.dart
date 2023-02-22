import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:paper_chat/provider/db_provider.dart';
import 'package:paper_chat/provider/visible_provider.dart';
import 'package:paper_chat/utils/chat_textfield.dart';
import 'package:provider/provider.dart';

import '../database/message_store.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  bool isCurrentUser = false;
  @override
  Widget build(BuildContext context) {
    var visibility = Provider.of<ChatVisibility>(context);
    var chats = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paper Chat'),
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
                    padding: EdgeInsets.fromLTRB(
                      isCurrentUser ? 64.0 : 16.0,
                      4,
                      isCurrentUser ? 16.0 : 64.0,
                      4,
                    ),
                    child: Bubble(
                      color:
                          visibility.isVisible ? Colors.blue : Colors.grey[300],
                      alignment: isCurrentUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      stick: true,
                      child: Text(chats.message[index],
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: visibility.isVisible
                                        ? Colors.white
                                        : Colors.black87,
                                  )),
                    ));
              },
            ),
          )),
          ChatTextField(
              isFriend: isCurrentUser ? false : true,
              isMe: isCurrentUser ? true : false),
        ],
      ),
    );
  }
}
