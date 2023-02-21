import 'package:flutter/material.dart';

class ChatVisibility extends ChangeNotifier {
  bool _isVisible = false;
  bool get isVisible => _isVisible;
  void visible(value) {
    _isVisible = value;
    notifyListeners();
  }
}
