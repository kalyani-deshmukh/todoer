import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoer_app/provider/google_sign_in_provider.dart';
import 'package:todoer_app/provider/todo_provider.dart';
import 'package:todoer_app/routes/routes.dart';
import 'package:todoer_app/ui/home/home_page.dart';
import 'package:todoer_app/ui/login_page.dart';
import 'package:todoer_app/ui/myday_page.dart';
import 'package:todoer_app/ui/settings_page.dart';
import 'package:todoer_app/ui/splash/splash_page.dart';

class MyTodoer extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //create: (context) => ToDosProvider(),
        Provider<ToDosProvider>(create: (_) => ToDosProvider()),
        Provider<GoogleSignInProvider>(create: (_) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          //'/': (context)=> SplashPage(),
          TodoerRoutes.LoginPageRoute: (context) => LoginPage(),
          TodoerRoutes.HomePageRoute : (context) => HomePage(),
          TodoerRoutes.SettingsPageRoute: (context) => SettingsPage(),
          TodoerRoutes.MyDayPageRoute : (context) => MyDayPage(),
        },
        home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('you have an Error! ${snapshot.error.toString()}');
              return Text('Ooops! something went wrong');
            } else if (snapshot.hasData) {
              return SplashPage();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
