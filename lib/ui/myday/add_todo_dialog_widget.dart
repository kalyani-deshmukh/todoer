import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoer_app/model/todo_model.dart';
import 'package:todoer_app/provider/todo_provider.dart';
import 'package:todoer_app/routes/routes.dart';

class AddToDoDialogWidget extends StatefulWidget {
  const AddToDoDialogWidget({Key? key}) : super(key: key);

  @override
  _AddToDoDialogWidgetState createState() => _AddToDoDialogWidgetState();
}

class _AddToDoDialogWidgetState extends State<AddToDoDialogWidget> {
  //final _fireStore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToDoFormWidget(
            onChangedTitle: (title){
              setState(() => this.title = title);
            },
            onSavedTodo: (){
              addTodo();
              // _fireStore
              //     .collection('/todos/')
              //     .add({'task': title}
              // );
            },
          )
        ],
      ),
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final todo = ToDo(
        id: DateTime.now().toString(),
        dateTime: DateTime.now(),
        title: title,
        isDone: false,
      );
      Provider.of<ToDosProvider>(context,listen: false).addTodo(todo);
      Navigator.of(context).popAndPushNamed(TodoerRoutes.MyDayPageRoute);
    }
  }
}

class ToDoFormWidget extends StatefulWidget {
  final String? title;
  final ValueChanged<String> onChangedTitle;
  final VoidCallback onSavedTodo;
  ToDoFormWidget(
      {Key? key,
      required this.onChangedTitle,
      required this.onSavedTodo,
      this.title})
      : super(key: key);

  @override
  _ToDoFormWidgetState createState() => _ToDoFormWidgetState();
}

class _ToDoFormWidgetState extends State<ToDoFormWidget> {

  late Color buttonColor = Colors.grey.shade800;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    buildTitle(),
                    buildButton(),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    buildRowElements(
                        icon: Icons.calendar_today_outlined,
                        label: 'Set due date'),
                    Spacer(),
                    buildRowElements(
                        icon: Icons.doorbell_rounded, label: 'Remind me'),
                    Spacer(),
                    buildRowElements(icon: Icons.repeat, label: 'Repeat'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle() => Flexible(
        child: TextFormField(
          maxLines: 10,
          cursorHeight: 20,
          onChanged: widget.onChangedTitle,
          validator: (title) {
            if (title!.isEmpty) {
              return 'can\'t be empty';
            }
            if (title.isNotEmpty) {
              setState(() {
                buttonColor = Colors.indigo.shade800;
              });
            }
            return null;
          },
          decoration: InputDecoration(
              //border: UnderlineInputBorder(),
              prefix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle,
                  color: Colors.grey,
                ),
              ),
              hintText: 'Add a task'),
        ),
      );

  Widget buildButton() {
    return Container(
      width: 25,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: buttonColor,
      ),
      child: InkWell(
        child: Icon(
          Icons.arrow_upward,
          color: Colors.white,
          size: 25,
        ),
        onTap: widget.onSavedTodo
      ),
    );
  }

  Widget buildRowElements({required IconData icon, required String label}) =>
      Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              label,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
        ],
      );
}