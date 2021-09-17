import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoer_app/ui/home/home_page.dart';
import 'package:todoer_app/ui/login_page.dart';
import 'package:todoer_app/ui/myday_page.dart';
import 'package:todoer_app/ui/settings_page.dart';
import 'package:todoer_app/ui/splash/splash_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context)=> SplashPage(),
        '/login': (context)=> LoginPage(),
        '/home': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
        '/myday': (context) => MyDayPage(),
      },

    );
  }
}

