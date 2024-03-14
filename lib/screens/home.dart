import 'package:basic_todoapp/constants/color.dart';
import 'package:basic_todoapp/constants/tasktype.dart';
import 'package:basic_todoapp/model/task.dart';
import 'package:basic_todoapp/screens/add_new_task.dart';
import 'package:basic_todoapp/service/todo_service.dart';
import 'package:basic_todoapp/todoitem.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<String> todo = ["Study Lessons", "Run 5K", "Go to party"];
  //List<String> completed = ["Game meetup", "Take out tash"];

  List<Task> todo = [
    Task(
      type: TaskType.note,
      title: "Study Lessons",
      description: "Study COMP1117",
      isCompleted: false,
    ),
    Task(
      type: TaskType.calendar,
      title: "Go to party",
      description: "Attend to party",
      isCompleted: false,
    ),
    Task(
      type: TaskType.contest,
      title: "Run 5K",
      description: "Run 5 kilometers",
      isCompleted: false,
    ),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  List<Task> completed = [
    Task(
      type: TaskType.calendar,
      title: "Go to party",
      description: "Attend to party",
      isCompleted: false,
    ),
    Task(
      type: TaskType.contest,
      title: "Run 5K",
      description: "Run 5 kilometers",
      isCompleted: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();

    double deviceHeight =
        MediaQuery.of(context).size.height; //telefona gore yukseklik secildi
    double deviceWidth =
        MediaQuery.of(context).size.width; //telefona gore genislik secildi
    return MaterialApp(
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
              //Top Column
              //(Column'a ctrl+shift+r widget) Colum disindaki her alani rahatlikla kullanmak icin
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    20, 10, 20, 10), //alan etrafina bosluk olusturma icin
                child: SingleChildScrollView(
                  //(Column'a ctrl+shift+r widget)
                  child: FutureBuilder(
                    future: todoService.getUncompletedTodos(),
                    builder: (context, snapshot) {
                      //verinin cekildigi saatteki verinin goruntusu
                      if (snapshot.data == null) {
                        return const CircularProgressIndicator();
                      } else {
                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return TodoItem(
                              task: snapshot.data![index],
                            );
                          },
                        );
                      }
                    },
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
                  child: FutureBuilder(
                    future: todoService.getCompletedTodos(),
                    builder: (context, snapshot) {
                      //verinin cekildigi saatteki verinin goruntusu
                      if (snapshot.data == null) {
                        return const CircularProgressIndicator();
                      } else {
                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return TodoItem(
                              task: snapshot.data![index],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddNewTaskScreen(
                      addNewTask: (newTask) => addNewTask(newTask),
                    ),
                  )); //AddNewTaskScreen sayfasina gecis yapmak icin
                },
                child: const Text("Add New Task"))
          ],
        ),
      ),
    ));
  }
}
