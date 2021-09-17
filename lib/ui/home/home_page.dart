import 'package:flutter/material.dart';
import 'package:todoer_app/ui/home/default_task_listview_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              child: Text("Kd"),
              backgroundColor: Colors.deepPurple,
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
                "Kalyani Deshmukh ",
                style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            Text(
                'kalyanideshmukh002@gmail.com',
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


          // title: Text(
          //     "Kalyani Deshmukh ",
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 20.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          //
          // bottom: PreferredSize(
          //     child: Text(
          //         "kalyanideshmukh002@gmail.com",
          //       style: TextStyle(
          //         color: Colors.grey,
          //         fontSize: 12.0,
          //       ),
          //     ),
          //     preferredSize: Size(0.0, 0.0)
          // ),
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
