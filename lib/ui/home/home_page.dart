import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoer_app/routes/routes.dart';
import 'package:todoer_app/ui/home/default_task_listview_widget.dart';
import 'package:todoer_app/ui/search/search_page.dart';

const String defaultName = "UserName";

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
            child: Hero(
              tag: 'profile',
              child: CircleAvatar(
                //child: Text("Kd"),
                //backgroundColor: Colors.deepPurple,
                backgroundImage: NetworkImage("${user!.photoURL}"),
              ),
            ),
          ),
          title: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(TodoerRoutes.SettingsPageRoute);
            },
            child: Hero(
              tag: 'userName',
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Row(
                        children: [
                          Text(
                            "${user!.displayName ?? defaultName}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                              Icons.expand_less,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        "${user!.email}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          actions: <Widget>[
           IconButton(
               onPressed: (){
                 // showSearch(
                 //     context: context,
                 //     delegate: SearchData()
                 // );
               },
               icon:  Icon(
                 Icons.search,
                 color: Colors.blueAccent,
                 size: 35,
               ),
           ),
          ],
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
