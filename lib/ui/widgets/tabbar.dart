import 'package:flutter/material.dart';

class TabBarItens {
  static Tab criar(IconData icon, String text) {
    return Tab(
      icon: Icon(icon),
      text: text,
      iconMargin: const EdgeInsets.all(2),
    );
  }
}
