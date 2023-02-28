// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:paper_chat/provider/db_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../module/chat_module.dart';
import 'colors.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
  });

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChatProvider>(context, listen: false);

    return ValueListenableBuilder<TextEditingValue>(
        valueListenable: _controller,
        builder: (context, val, _) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            color: bgColor,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    maxLines: 3,
                    minLines: 1,
                    cursorColor: mainColor,
                    decoration: InputDecoration(
                      hintText: 'Type your message here',
                      prefixIcon: GestureDetector(
                        onTap: val.text.isNotEmpty
                            ? () async {
                                var message = ChatMessage(
                                  messageContent: _controller.text,
                                  time: DateTime.now(),
                                  messageType: 'receiver',
                                );
                                provider.addMessage(message);
                                _controller.clear();
                              }
                            : null,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Color.fromARGB(255, 15, 197, 179),
                          ),
                          child: Icon(
                            Icons.send,
                            textDirection: TextDirection.rtl,
                            color: val.text.isNotEmpty ? mainColor : grey,
                          ),
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: val.text.isNotEmpty
                            ? () {
                                var message = ChatMessage(
                                  messageContent: _controller.text,
                                  time: DateTime.now(),
                                  messageType: 'sender',
                                );
                                provider.addMessage(message);
                                _controller.clear();
                              }
                            : null,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Color.fromARGB(255, 15, 197, 179),
                          ),
                          child: Icon(
                            Icons.send,
                            color: val.text.isNotEmpty ? mainColor : grey,
                          ),
                        ),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 15.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25)),
                      filled: true,
                      fillColor: white,
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   width: 10,
            // ),
            // ],
            // ),
          );
        });
  }
}
