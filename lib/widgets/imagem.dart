import 'package:flutter/material.dart';

class Imagem {
  static Widget criar(String caminho, {double w, double h}) {
    return Image(
      image: AssetImage(caminho),
      fit: BoxFit.cover,
      width: w,
      height: h,
    );
  }
}