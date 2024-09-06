import 'package:flutter/material.dart';

class ExpandableTextProvider extends ChangeNotifier {
  bool isExpanded = false;

  void expandText() {
    isExpanded = !isExpanded;

    notifyListeners();
  }
}
