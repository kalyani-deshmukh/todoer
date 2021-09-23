import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoer_app/ui/home/home_page.dart';
import 'package:todoer_app/ui/login_page.dart';

class LoggedInCheckPage extends StatelessWidget {
  const LoggedInCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapShot){
          if(snapShot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapShot.hasData){
            return HomePage();
          }else if(snapShot.hasError){
            return Center(child: Text('Something Went Wrong! ${snapShot.error}'));
          }else{
            return LoginPage();
          }
        },
      ),
    );
  }
}
