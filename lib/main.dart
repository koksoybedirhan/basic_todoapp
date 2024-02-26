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
    double deviceHeight =
        MediaQuery.of(context).size.height; //telefona gore yukseklik secildi
    double deviceWidth =
        MediaQuery.of(context).size.width; //telefona gore genislik secildi

    return MaterialApp(
      //Container yerine MaterialApp konuldu, beyaz ekran oldu
      debugShowCheckedModeBanner: false, //sag ustteki debug yazisi kaldirildi
      home: SafeArea(
        //(Container ctrl+shift+r widget) En üstteki app bar'i kapadi
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            //(Container ctrl+shift+r widget) Header
            children: [
              Container(
                //Header
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
              Expanded(
                //Top Columng
                //(Column'a ctrl+shift+r widget) Colum disindaki her alani rahatlikla kullanmak icin
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), //alan etrafina bosluk olusturma icin
                  child: SingleChildScrollView(
                    //(Column'a ctrl+shift+r widget)
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20)), //alanın etrafina shape vermek icin
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.notes_outlined,
                                  size: 50,
                                ), //icon olusturma
                                const Text(
                                  "Study Lessons",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          }) //butona basilma kismi
                                        })
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20)), //alanın etrafina shape vermek icin
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.notes_outlined,
                                  size: 50,
                                ), //icon olusturma
                                const Text(
                                  "Study Lessons",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          }) //butona basilma kismi
                                        })
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20)), //alanın etrafina shape vermek icin
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.notes_outlined,
                                  size: 50,
                                ), //icon olusturma
                                const Text(
                                  "Study Lessons",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          }) //butona basilma kismi
                                        })
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                //Completed Text
                //(Paddinge ctrl+shift+r widget) yaziyi sola 20 oteleme
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  //(Text'e ctrl+shift+r widget) yaziyi sol alta aldi
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                //Bottom Column
                //(Column'a ctrl+shift+r widget) Colum disindaki her alani rahatlikla kullanmak icin
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), //alan etrafina bosluk olusturma icin
                  child: SingleChildScrollView(
                    //(Column'a ctrl+shift+r widget)
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20)), //alanın etrafina shape vermek icin
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.notes_outlined,
                                  size: 50,
                                ), //icon olusturma
                                const Text(
                                  "Study Lessons",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          }) //butona basilma kismi
                                        })
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20)), //alanın etrafina shape vermek icin
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.notes_outlined,
                                  size: 50,
                                ), //icon olusturma
                                const Text(
                                  "Study Lessons",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          }) //butona basilma kismi
                                        })
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20)), //alanın etrafina shape vermek icin
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.notes_outlined,
                                  size: 50,
                                ), //icon olusturma
                                const Text(
                                  "Study Lessons",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (val) => {
                                          setState(() {
                                            isChecked = val!;
                                          }) //butona basilma kismi
                                        })
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Add New Task"))
            ],
          ),
        ),
      ),
    );
  }
}
