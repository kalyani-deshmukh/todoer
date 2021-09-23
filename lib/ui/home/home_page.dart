import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoer_app/ui/home/default_task_listview_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              //child: Text("Kd"),
              //backgroundColor: Colors.deepPurple,
              backgroundImage: NetworkImage("${user!.photoURL}"),
            ),
          ),
          title: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, "/settings");
            },
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user!.displayName}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${user!.email}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ]),
          ),
          actions: <Widget>[ Icon(
            Icons.search,
            color: Colors.blueAccent,
            size: 35,
          )],
        ),
        body: Column(
              children: [
                DefaultTaskListViewWidget(),
              ],
        ),
      ),
    );
  }
}
