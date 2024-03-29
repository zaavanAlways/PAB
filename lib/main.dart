import 'package:flutter/material.dart';
import 'package:nakama_shoes/view/Navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      title: 'Nakama Shoes',
      home: MainNavigator(),
    );
  }
}
