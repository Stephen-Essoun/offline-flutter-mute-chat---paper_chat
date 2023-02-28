import 'package:flutter/material.dart';
import 'package:paper_chat/module/chat_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatProvider extends ChangeNotifier {
  List<ChatMessage> chats =[] ;

  List get message => chats;
 void addToStore(data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('messages', data);
  }

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
