import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        body: Column(
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
          ],
        ),
      ),
    );
  }
}
