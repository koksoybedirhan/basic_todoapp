import 'package:basic_todoapp/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

/*
Terminal kullanimi:
  flutter pub add hexcolor --> renkler icin hex kodu yukler
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //statelessWidget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight =
        MediaQuery.of(context).size.height; //telefona gore yukseklik secildi
    double deviceWidth =
        MediaQuery.of(context).size.width; //telefona gore genislik secildi
    return MaterialApp(
      //Container yerine MaterialApp konuldu, beyaz ekran oldu
      debugShowCheckedModeBanner: false, //sag ustteki debug yazisi kaldirildi
      home: SafeArea( //(Container ctrl+shift+r widget) En üstteki app bar'i kapadi
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor
          ),
          body: Container( //body kismina erismek icin
            width: deviceWidth,
            height: deviceHeight / 3,
            decoration: const BoxDecoration(
                //sayfayi dekore etmek icin kullanilir
                color: Colors.deepPurple, //renk verdik
                image: DecorationImage(
                    image: AssetImage("lib/assets/images/header.png"),
                    fit: BoxFit.cover)), //icerisine image ekledik
            child: const Column(
              children: [
                Padding(
                  //(Texte ctrl+shift+r widget) ustten bosluk verdik
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "February 25, 2024",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ), //Text ekleyip rengini degisip fontunu buyutup bold yaptik
                Padding(
                  //(Texte ctrl+shift+r widget) ustten bosluk verdik
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "My Todo List App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ), //Text ekleyip rengini degisip fontunu buyutup bold yaptik
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
