import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoer_app/provider/google_sign_in_provider.dart';
import 'package:todoer_app/routes/routes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.of(context).popAndPushNamed(TodoerRoutes.HomePageRoute);
          },
        ),
        title: Text("Settings"),
      ),
      body: Container(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: 'profile',
                        child: CircleAvatar(
                          //child: Text("Kd"),
                          //backgroundColor: Colors.deepPurple,
                          maxRadius: 40,
                          backgroundImage: NetworkImage("${user!.photoURL}"),
                        ),
                      ),
                      Hero(
                        tag: 'userName',
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: Row(
                                  children: [
                                    Text(
                                      "${user.displayName}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.expand_more),
                                  ],
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  "${user.email}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: Colors.blueGrey.shade800,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(100, 50),
                    ),
                    child: Text(
                      "SIGN OUT",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.logout();
                      Navigator.of(context).pushReplacementNamed(TodoerRoutes.LoginPageRoute);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
