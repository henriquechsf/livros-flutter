import 'package:flutter/material.dart';

class ErroListagem {
  static Widget criar(String texto) {
    return Column(
      children: [
        Icon(Icons.error_outline, size: 100, color: Colors.red,),
        Text(texto, style: TextStyle(fontSize: 20, color: Colors.red),)
      ],
    );
  }
}