import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todoer_app/database/database.dart';
import 'package:todoer_app/model/todo_model.dart';
import 'package:todoer_app/provider/todo_provider.dart';


class ToDoListWidget extends StatelessWidget {
  const ToDoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
  final provider = Provider.of<ToDosProvider>(context);
  final todos = provider.todos;
  //   return  Container(
  //         height: MediaQuery.of(context).size.height - 150,
  //       width: double.infinity,
  //       margin: EdgeInsets.only(top: 20),
  //       child: ListView.builder(
  //         scrollDirection: Axis.vertical,
  //         physics: AlwaysScrollableScrollPhysics(),
  //         shrinkWrap: true,
  // padding: EdgeInsets.all(16),
  // itemCount: todos.length,
  // itemBuilder: (context,index){
  //       final todo = todos[index];
  //       return ToDoWidget(todo: todo);
  // },
  // ),
  //   );


    return StreamBuilder(
      stream: Database.readItem(),
        builder: (context,AsyncSnapshot snapshot){
        if(snapshot.hasError){
          // read data from offline storage
          return  Container(
            height: MediaQuery.of(context).size.height - 150,
            width: double.infinity,
            margin: EdgeInsets.only(top: 20),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              itemCount: todos.length,
              itemBuilder: (context,index){
                final todo = todos[index];
                return ToDoWidget(todo: todo);
              },
            ),
          );
        }
        else if(snapshot.hasData || snapshot.data!=null){
          //Read data from fireStore
          return  ListView.separated(
            shrinkWrap: true,
            itemCount: snapshot.data.docs.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 5,),
            itemBuilder: (context, int index){
              var todoInfo = snapshot.data.docs[index].data() as Map<String, dynamic>;
              String docId = snapshot.data.docs[index].id;
              DateTime updateDateTime = DateTime.fromMillisecondsSinceEpoch(
                  todoInfo['dateTime'].millisecondsSinceEpoch);
              final todo = ToDo(
                   dateTime: updateDateTime,
                  isDone: todoInfo['isDone'],
                  title: todoInfo['title']);
              return ToDoWidget(todo: todo);
            },
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        }
    );


  //   // TODO: Read data from firestore
  // return StreamBuilder<QuerySnapshot>(
  //   stream: FirebaseFirestore.instance.collection('/todos/').snapshots(),
  //   builder: (BuildContext context,
  //       AsyncSnapshot<QuerySnapshot> snapshot) {
  //     switch (snapshot.connectionState) {
  //       case ConnectionState.waiting:
  //         return  Center(child:  CircularProgressIndicator());
  //       default:
  //         return ListView.builder(
  //           scrollDirection: Axis.vertical,
  //           physics: AlwaysScrollableScrollPhysics(),
  //           shrinkWrap: true,
  //           padding: EdgeInsets.all(16),
  //           itemCount: todos.length,
  //           itemBuilder: (context,index){
  //             final todo = snapshot.data!.docs[index];
  //             return ToDoWidget(todo: todo);
  //           },
  //         );
  //     }
  //   },
  // );

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
