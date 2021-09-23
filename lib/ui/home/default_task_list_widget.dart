
import 'package:flutter/material.dart';

class DefaultTaskListTileWidget extends StatelessWidget {

  final IconData icon;
  final String title;
  final String trailing;

  DefaultTaskListTileWidget(this.icon, this.title, this.trailing);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
        leading:  Icon(this.icon, color: Colors.black),
        title:  Text(this.title, style: TextStyle( fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black)),
        trailing:  Text(this.trailing, style: TextStyle(color: Colors.black)),
        contentPadding: EdgeInsets.only(right: 15, left: 15),
        dense: true,
        onTap: () {
          /*
        Navigator.pushNamed(
          context,
          'todoListRoute',
          arguments: TodoListRouteArguments('Untitled Task', true)
          */
          Navigator.pushNamed(context, '/myday');

        }
    );
  }
}
