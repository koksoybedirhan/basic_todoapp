import 'package:basic_todoapp/screens/home.dart';
import 'package:flutter/material.dart';

/*
Terminal kullanimi:
  flutter pub add hexcolor --> renkler icin hex kodu yukler
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  //statefulWidget
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        //Container yerine MaterialApp konuldu, beyaz ekran oldu
        debugShowCheckedModeBanner: false, //sag ustteki debug yazisi kaldirildi
        home: HomeScreen());
  }
}
