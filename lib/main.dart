import 'package:aulabancodados/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]
  );

  runApp(MaterialApp(
    title: "Meus Livros",
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}