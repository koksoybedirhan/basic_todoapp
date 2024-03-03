import 'package:basic_todoapp/constants/tasktype.dart';

class Task {
  //maindeki listleri tutmak icin kullanilir
  Task(
      {required this.type,
      required this.title,
      required this.description,
      required this.isCompleted});

  final TaskType type;
  final String title;
  final String description;
  bool isCompleted;
}
