import 'package:flutter/material.dart';
import 'package:todoer_app/ui/myday/add_todo_dialog_widget.dart';
import 'package:todoer_app/ui/myday/mypopup_button.dart';
import 'package:todoer_app/ui/myday/todo_list_widget.dart';

class MyDayPage extends StatefulWidget {
  const MyDayPage({Key? key}) : super(key: key);

  @override
  _MyDayPageState createState() => _MyDayPageState();
}

class _MyDayPageState extends State<MyDayPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/myday.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            title: Text(
              'My Day',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              MyPopupButton(),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ToDoListWidget()
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal.shade800,
            child: Icon(Icons.add),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddToDoDialogWidget();
              },
            ),
          ),
        ),
    );
  }
}
