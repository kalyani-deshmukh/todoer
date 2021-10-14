import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoer_app/database/database.dart';
import 'package:todoer_app/model/todo_model.dart';

class ToDosProvider extends ChangeNotifier{
  List<ToDo> _todos = [
    ToDo(
        dateTime: DateTime.now(),
        isDone: false,
        title: "Take a power nap"
    ),
    ToDo(
        dateTime: DateTime.now(),
        isDone: false,
        title: "Do a load of laundry"
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

  List<ToDo> get todos => [..._todos];

  void addTodo(ToDo todo) {
    _todos.add(todo);
    // FirebaseFirestore.instance
    //     .collection('/todos/')
    //     .add({
    //   'task': todo.title,
    //   'dateTime':todo.dateTime,
    //   'isDone': todo.isDone,
    //     }
    // );

    Database.addItem(title: todo.title, dateTime: todo.dateTime, isDone: todo.isDone);
    notifyListeners();
  }

}