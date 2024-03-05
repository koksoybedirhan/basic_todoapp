class Todo {
  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  //nullable degiskenler: http ile postlanma sirasinda deger bos da gidebilecegi icin ? isareti koyduk
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  //From JSON (Json'a veri gonderme yeri)
  Todo.fromJson(Map<String, dynamic> json)
  {
    id = json["id"];
    todo = json["todo"];
    completed = json["completed"];
    userId = json["userId"];
  }

  //To JSON
  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["todo"] = todo;
    data["completed"] = completed;
    data["userId"] = userId;

    return data;
  }
}
