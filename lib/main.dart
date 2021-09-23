import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoer_app/provider/google_sign_in_provider.dart';
import 'package:todoer_app/provider/todo_provider.dart';
import 'package:todoer_app/ui/home/home_page.dart';
import 'package:todoer_app/ui/login_page.dart';
import 'package:todoer_app/ui/myday_page.dart';
import 'package:todoer_app/ui/settings_page.dart';
import 'package:todoer_app/ui/splash/splash_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  // This widget is the root of your application.

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
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          //'/': (context)=> SplashPage(),
          '/login': (context)=> LoginPage(),
          '/home': (context) => HomePage(),
          '/settings': (context) => SettingsPage(),
          '/myday': (context) => MyDayPage(),
        },
        home: FutureBuilder(
          future: _fbApp,
          builder: (context,snapshot){
            if(snapshot.hasError){
              print('you have an Error! ${snapshot.error.toString()}');
              return Text('Ooops! something went wrong');
            }else if(snapshot.hasData){
              return SplashPage();
            }else{
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


