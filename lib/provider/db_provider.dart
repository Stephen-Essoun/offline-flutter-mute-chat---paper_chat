import 'package:flutter/material.dart';
import 'package:paper_chat/module/chat_module.dart';

class ChatProvider extends ChangeNotifier {
  List<ChatMessage> chats = [];

  List get message => chats;
  void addMessage(ChatMessage chat) {
    chats.insert(0, chat);
    notifyListeners();
  }

  void deletMessage(int index) {
    chats.removeAt(index);
    notifyListeners();
  }

  void deletAllMessages() {
    chats.clear();
    notifyListeners();
  }
}
