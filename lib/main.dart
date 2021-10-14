import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoer_app/todoer.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  runApp(MyTodoer());
}

