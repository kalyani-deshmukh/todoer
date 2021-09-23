import 'package:flutter/material.dart';
import 'package:todoer_app/model/todo_model.dart';

class ToDosProvider extends ChangeNotifier{
  List<ToDo> _todos = [
    ToDo(
        dateTime: DateTime.now(),
        isDone: false,
        title: "Go For Shopping Bitch!"
    ),
    ToDo(
        dateTime: DateTime.now(),
        isDone: false,
        title: "gym Bitch!"
    ),
    ToDo(
        dateTime: DateTime.now(),
        isDone: false,
        title: "Yoga Classes sharp 5.00!"
    ),
    ToDo(
        dateTime: DateTime.now(),
        isDone: false,
        title: "Movie night!"
    ),
  ];

  List<ToDo> get todos => _todos;

  void addTodo(ToDo todo) {
    _todos.add(todo);
    notifyListeners();
  }

}