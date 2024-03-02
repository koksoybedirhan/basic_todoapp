import 'package:basic_todoapp/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight =
        MediaQuery.of(context).size.height; //telefona gore yukseklik secildi
    double deviceWidth =
        MediaQuery.of(context).size.width; //telefona gore genislik secildi
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(), //Navigator'den gelen sayfaya geri donmek icin, otomatik doner
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView(
          //ekran sabit kalmak yerine asagi yukari kayan ekran oldu
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 10,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("lib/assets/images/add_new_task_header.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                        child: Text(
                      "Add new Task",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: const Text("Task Title")),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration:
                      InputDecoration(filled: true, fillColor: Colors.white),
                ),
              ), //text icine yazi yazmayi aktif eder (telefon klavyesi ile)
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Category"),
                    GestureDetector(
                      //ekrana basmaya gore islem yapmak icin
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            //butona basildiginda ne yapilmasi gerektiğini yapar
                            duration: Duration(
                                milliseconds:
                                    300), //kac saniye calistigini belirten fonksiyon
                            content: Text("Category Selected"),
                          ),
                        );
                      },
                      child: Image.asset("lib/assets/images/category_1.png"),
                    ),
                    GestureDetector(
                      //ekrana basmaya gore islem yapmak icin
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            //butona basildiginda ne yapilmasi gerektiğini yapar
                            duration: Duration(
                                milliseconds:
                                    300), //kac saniye calistigini belirten fonksiyon
                            content: Text("Category Selected"),
                          ),
                        );
                      },
                      child: Image.asset("lib/assets/images/category_2.png"),
                    ),
                    GestureDetector(
                      //ekrana basmaya gore islem yapmak icin
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            //butona basildiginda ne yapilmasi gerektiğini yapar
                            duration: Duration(
                                milliseconds:
                                    300), //kac saniye calistigini belirten fonksiyon
                            content: Text("Category Selected"),
                          ),
                        );
                      },
                      child: Image.asset("lib/assets/images/category_3.png"),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("Date"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("Time"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 10), child: Text("Notes")),
              const SizedBox(
                height: 280,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                      filled: true, fillColor: Colors.white, isDense: true),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
