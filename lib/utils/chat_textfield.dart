// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:paper_chat/provider/db_provider.dart';
import 'package:paper_chat/provider/visible_provider.dart';
import 'package:provider/provider.dart';

class ChatTextField extends StatelessWidget {
  ChatTextField({
    super.key,
  });
  String message = '';
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChatProvider>(context, listen: false);
    var visibility = Provider.of<ChatVisibility>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              message = _controller.text;
              provider.addMessage(message);
              visibility.visible(true);
            },
            child: Container(
              color: Colors.white,
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: 3,
              minLines: 1,
              decoration: InputDecoration(
                labelText: 'labelText',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                // floatingLabelStyle:  TextStyle(color: ),
                filled: true,
                fillColor: Colors.white,
                labelStyle: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              message = _controller.text;
              provider.addMessage(message);
              visibility.visible(false);
            },
            child: Container(
              color: Colors.white,
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
