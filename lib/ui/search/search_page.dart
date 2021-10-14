// import 'package:flutter/material.dart';
// import 'package:todoer_app/provider/todo_provider.dart';
//
// //final provider = Provider.of<ToDosProvider>(context);
// final todos = ToDosProvider().todos;
//
// // class SearchPage extends StatelessWidget {
// //   const SearchPage({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container();
// //   }
// // }
//
// class SearchData extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     //actions for appbar
//     // TODO: implement buildActions
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     //leading icon on left of the appbar
//     return IconButton(
//       onPressed: () {},
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.arrow_menu,
//         progress: transitionAnimation,
//       ),
//     );
//     // throw UnimplementedError();
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     //show searched suggestions here
//     final suggestionList = [];
//     if (query.isEmpty) {
//       return Center(
//           child: Container(
//         child: Column(
//           children: [
//             Image.asset("asset/images/search_icon.png"),
//             Text(
//                 "What would you like to find? you can search within tasks, steps, and notes")
//           ],
//         ),
//       ));
//     } else if (query.isNotEmpty) {
//       return ListView.builder(
//         itemCount: suggestionList.length,
//         itemBuilder: (context, index) => ListTile(
//           leading: Icon(Icons.circle_notifications_outlined),
//           title: Text("${suggestionList[index]}"),
//           subtitle: Text("tasks"),
//           trailing: Icon(Icons.star_border_outlined),
//         ),
//       );
//     } else
//       throw UnimplementedError();
//   }
// }
