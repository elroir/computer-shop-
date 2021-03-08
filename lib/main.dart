import 'package:design_patterns/pages/detail.dart';
import 'package:design_patterns/pages/home.dart';
import 'package:design_patterns/pages/ready.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Configurador',
      theme: ThemeData.dark(),
      initialRoute: 'home',
      routes: {
        'home'             : (BuildContext context) => HomePage(),
        'ready'            : (BuildContext context) => ReadyPage(),
        'detail'           : (BuildContext context) => DetailPage()
      },
    );
  }
}