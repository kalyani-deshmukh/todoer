class ToDoField{
  static const createdTime = 'createdTime';
}

class ToDo{
  DateTime dateTime;
  String title;
  bool isDone;
  String? id;

  ToDo({required this.dateTime,required this.isDone,required this.title, this.id});

  
   ToDo firebaseDataToToDo(Map<String, dynamic> data){
    ToDo todo = ToDo(dateTime: data['dateTime'], isDone: data['isDone'], title: data['title']);
    return todo;
  }
}