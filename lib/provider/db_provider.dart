import 'package:flutter/material.dart';
import 'package:paper_chat/database/message_store.dart';

class ChatProvider extends ChangeNotifier {
  List chats = [];

  List get message => chats;
  void addMessage(String chat) {
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
