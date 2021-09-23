import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todoer_app/model/todo_model.dart';
import 'package:todoer_app/provider/todo_provider.dart';


class ToDoListWidget extends StatelessWidget {
  const ToDoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
  final provider = Provider.of<ToDosProvider>(context);
  final todos = provider.todos;
    return ListView.separated(
        shrinkWrap: true,
  padding: EdgeInsets.all(16),
  separatorBuilder: (context,index) => Container(height: 8,),
  itemCount: todos.length,
  itemBuilder: (context,index){
    final todo = todos[index];
    return ToDoWidget(todo: todo);
  },
  );
  }
}

class ToDoWidget extends StatelessWidget {
  final ToDo todo;
  const ToDoWidget({Key? key,required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
    actionPane: SlidableDrawerActionPane(),
      key: Key(todo.id??'0'),
      actions: [
        IconSlideAction(
          color: Colors.green,
          onTap: (){},
          caption: 'Edit',
          icon: Icons.edit,
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          onTap: (){},
          caption: 'Delete',
          icon: Icons.delete,
        ),
      ],
      child: buildTodo(context)
  );

  Widget buildTodo(BuildContext context) {
    return Card(
      color: Colors.grey.shade400,
      child: Row(
        children: [
          Checkbox(
              activeColor:  Theme.of(context).primaryColor,
              checkColor: Colors.grey.shade800,
              value: todo.isDone,
              onChanged: (bool){}
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Container(
              child: Text(todo.title),
            ),
          )
        ],
      ),
    );
  }
}
