import 'dart:convert';

import 'package:basic_todoapp/model/todo.dart';
import 'package:http/http.dart' as http;

//todo islemlerinin json ile haberlesmesini saglayan yer
class TodoService {
  final String url = "https://dummyjson.com/todos/"; //base url

  Future<List<Todo>> getUncompletedTodos() async {
    //async eklenerek kod asenkron yapildi, await islemi ile http'ye baglanana kadar beklendi
    //asenkron islem oldugu icin yani linke baglanmayi bekledigi icin future kullandik
    final response = await http.get(Uri.parse(url)); //url'den get yapildi
    List<dynamic> resp = jsonDecode(response.body)[
        "todos"]; //json formatindaki body kismini aldi, yani verilerin oldugu kisim
    List<Todo> todos =
        List.empty(growable: true); //listeye ekleme yapabilmeyi saglar

    resp.forEach((element) {
      //rensp listesindeki her elemani dolas
      Todo task = Todo.fromJson(element);
      if(task.completed! == false)
      {
        todos.add(task);
      }
      //todos listesine ekleme
    });

    return todos;
  }

    Future<List<Todo>> getCompletedTodos() async {
    //async eklenerek kod asenkron yapildi, await islemi ile http'ye baglanana kadar beklendi
    //asenkron islem oldugu icin yani linke baglanmayi bekledigi icin future kullandik
    final response = await http.get(Uri.parse(url)); //url'den get yapildi
    List<dynamic> resp = jsonDecode(response.body)[
        "todos"]; //json formatindaki body kismini aldi, yani verilerin oldugu kisim
    List<Todo> todos =
        List.empty(growable: true); //listeye ekleme yapabilmeyi saglar

    resp.forEach((element) {
      //rensp listesindeki her elemani dolas
      Todo task = Todo.fromJson(element);
      if(task.completed! == true)
      {
        todos.add(task);
      }
      //todos listesine ekleme
    });

    return todos;
  }
}
