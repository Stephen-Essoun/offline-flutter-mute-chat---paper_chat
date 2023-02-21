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
                return visibility.isVisible
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flexible(
                          child: Visibility(
                            // visible: visibility.isVisible ? false : true,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.5,
                              ),
                              // color: Colors.white,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  chats.message[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flexible(
                          child: Visibility(
                            // visible: visibility.isVisible ? true : false,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              // color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  chats.message[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              },
            ),
          )),
          ChatTextField(),
        ],
      ),
    );
  }
}
