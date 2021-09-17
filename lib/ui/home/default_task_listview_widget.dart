import 'package:flutter/material.dart';
import 'package:todoer_app/ui/home/default_task_list_widget.dart';

class DefaultTaskListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView(
        shrinkWrap: true,
        children: <Widget>[
          DefaultTaskListTileWidget(Icons.wb_sunny_outlined, 'My Day', '2'),
          DefaultTaskListTileWidget(Icons.star_outline_rounded, 'Important', '1'),
          DefaultTaskListTileWidget(Icons.date_range_rounded,'Planned', ''),
          DefaultTaskListTileWidget(Icons.person_outline, 'Assigned to Me', ''),
          DefaultTaskListTileWidget(Icons.fact_check_outlined,'Task', '17'),
          Divider(color: Colors.grey),
          DefaultTaskListTileWidget(Icons.format_list_bulleted, 'Ideas', '23')
        ]
    );
  }
}