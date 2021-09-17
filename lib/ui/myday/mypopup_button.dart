import 'package:flutter/material.dart';

class MyPopupButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert, color: Colors.white,),
      //don't specify icon if you want 3 dot menu
      //color: Colors.white,
      itemBuilder: (context) =>
      [
        const PopupMenuItem<int>(
            value: 0,
            child: ListTile(
              leading: Icon(Icons.sort_sharp),
              title: Text('Sort by'),
            )
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: ListTile(
            leading: Icon(Icons.palette_sharp),
            title: Text("Change theme"),),
        ),
        const PopupMenuItem<int>(
            value: 1,
            child: ListTile(
              leading: Icon(Icons.share),
              title: Text("Send a copy"),
            )
        ),
        const PopupMenuItem<int>(
            value: 1,
            child: ListTile(
              leading: Icon(Icons.print_outlined),
              title: Text("Print list"),
            )
        ),
      ],
      onSelected: (item) => {print(item)},

    );
  }
}